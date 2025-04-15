package com.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.enums.UserType;
import com.repository.UserRepository;
import com.service.JwtService;
import com.service.MailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

	@Autowired
	UserRepository userRepository;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MailService mailService;
	@Autowired
	JwtService jwtService;

	@GetMapping("signup")
	public String signUp() {
		return "SignUp";
	}

	@GetMapping(value = { "/", "login" })
	public String login() {
		return "Login";
	}

	@GetMapping("forgotpassword")
	public String forgotPassword() {
		return "ForgotPassword";
	}

	@GetMapping("/resetpassword")
	public String resetPassword(String token, Model model) {
		model.addAttribute("token", token);
		return "ResetPassword";
	}

	@GetMapping("Home")
	public String home() {
		return "Home";
	}

	@PostMapping("saveuser")
	public String saveUser(UserEntity userEntity, Model model) {

		Optional<UserEntity> op = userRepository.findByEmail(userEntity.getEmail());

		if (op.isEmpty()) {
			userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword()));
			userRepository.save(userEntity);

			new Thread(new Runnable() {
				public void run() {
					mailService.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
				}
			}).start();

			return "Login";
		}

		model.addAttribute("err", "account already exits");
		return "SignUp";
	}

	@PostMapping("checkcredentials")
	public String checkCredentials(UserEntity userEntity, Model model, HttpSession session) {

		Optional<UserEntity> op = userRepository.findByEmail(userEntity.getEmail());
		if (op.isPresent()) {

			UserEntity dbUser = op.get();
			if (passwordEncoder.matches(userEntity.getPassword(), dbUser.getPassword())) {
				session.setAttribute("user", dbUser);
				session.setAttribute("role", dbUser.getRole());
				if (dbUser.getRole() == UserType.USER) {
					return "Home";
				} else if (dbUser.getRole() == UserType.ADMIN) {
					return "redirect:/adm-listusers";
				}

			}
			model.addAttribute("err", "Invalid Password");
			return "Login";
		}

		model.addAttribute("err", "Invalid Email");
		return "Login";
	}

	@PostMapping("sendtoken")
	public String sendToken(UserEntity userEntity, Model model) {

		Optional<UserEntity> op = userRepository.findByEmail(userEntity.getEmail());

		if (op.isPresent()) {

			UserEntity dbUser = op.get();

			String token = jwtService.generateToken(dbUser.getEmail());

			// Send email with reset link
			mailService.sendResetPasswdMail(dbUser.getEmail(), token);
			return "Login";

		}
		model.addAttribute("err", "invalid credentails");
		return "ForgotPassword";

	}

	@PostMapping("changepassword")
	public String changePassword(UserEntity entity, String token, Model model) {

		String email = jwtService.validateToken(token);

		if (email != null) {

			Optional<UserEntity> op = userRepository.findByEmail(email);

			if (op.isPresent()) {
				UserEntity dbUser = op.get();

				dbUser.setPassword(passwordEncoder.encode(entity.getPassword()));
				userRepository.save(dbUser);

				return "Login";
			}
			model.addAttribute("err", "invalid email");
			return "Error";
		} else {
			model.addAttribute("err", "invalid token");
			return "Error";
		}
	}

	@GetMapping("logout")
	public String LogOut(HttpSession session) {

		session.invalidate();

		return "Login";
	}

}
