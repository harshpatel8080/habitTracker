package com.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.enums.GenderType;
import com.enums.UserType;
import com.repository.UserRepository;

@Controller
public class AdminController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@GetMapping("adm-adduser")
	public String useradd(Model model) {
		model.addAttribute("userTypes", UserType.values());
		return "addUser";
	}

	@GetMapping("/adm-listusers")
	public String listUsers(Model model) {

		model.addAttribute("users", userRepository.findAll());

		return "admUserList";
	}

	@PostMapping("/adm-deleteUser")
	public String deleteUser(Integer userId) {
		userRepository.deleteById(userId);
		return "redirect:/adm-listusers";
	}

	@GetMapping("/adm-editUser")
	public String showEditUserForm(Integer userId, Model model) {
		UserEntity user = userRepository.findById(userId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + userId));
		model.addAttribute("user", user);
		model.addAttribute("genderTypes", GenderType.values());
		model.addAttribute("userTypes", UserType.values());
		return "editUser";
	}

	// Process Edit User Form
	@PostMapping("/adm-updateUser")
	public String updateUser(UserEntity user) {
		UserEntity existingUser = userRepository.findById(user.getUserId())
				.orElseThrow(() -> new IllegalArgumentException("Invalid user Id: " + user.getUserId()));

		// Update user fields
		existingUser.setFirstName(user.getFirstName());
		existingUser.setLastName(user.getLastName());
		existingUser.setContactNumber(user.getContactNumber());
		existingUser.setEmail(user.getEmail());
		existingUser.setGender(user.getGender());
		existingUser.setRole(user.getRole());
		if (!user.getPassword().isBlank()) {
			existingUser.setPassword(user.getPassword());
		}

		userRepository.save(existingUser); // Save updated user
		return "redirect:/adm-listusers";
	}

	@PostMapping("/addUser")
	public String addUser(UserEntity userEntity, Model model) {

		Optional<UserEntity> op = userRepository.findByEmail(userEntity.getEmail());

		if (op.isEmpty()) {
			userEntity.setPassword(passwordEncoder.encode(userEntity.getPassword()));

			userRepository.save(userEntity);

			return "redirect:/adm-listusers";
		}

		model.addAttribute("err", "account already exits");
		return "addUser";

	}

}
