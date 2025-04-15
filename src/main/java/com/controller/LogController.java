package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.entity.HabitEntity;
import com.entity.LogEntity;
import com.entity.UserEntity;
import com.repository.HabitRepository;
import com.repository.LogRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogController {

	@Autowired
	LogRepository logRepository;
	@Autowired
	HabitRepository habitRepository;
	@Autowired
	Cloudinary cloudinary;

	@PostMapping("savelog")
	public String saveLog(LogEntity logEntity, MultipartFile image, HttpSession session) {

		try {
			if (!image.isEmpty()) {
				Map uploadResult = cloudinary.uploader().upload(image.getBytes(), ObjectUtils.emptyMap());
				String url = uploadResult.get("url").toString();
				logEntity.setImgPath(url);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println(logEntity);
		UserEntity userEntity = (UserEntity) session.getAttribute("user");
		logEntity.setUserId(userEntity.getUserId());

		logRepository.save(logEntity);
		return "Home";
	}

	@GetMapping("getlogs")
	public String getLogs(HttpSession session, Model model) {

		UserEntity userEntity = (UserEntity) session.getAttribute("user");

		List<LogEntity> logs = logRepository.findByUserId(userEntity.getUserId());

		System.out.println(logs);

		List<HabitEntity> habits = new ArrayList<>();
		for (LogEntity log : logs) {

			Optional<HabitEntity> op = habitRepository.findById(log.getHabitId());
			System.out.println(op);
			if (op.isPresent()) {

				habits.add(op.get());
			}
		}
		System.out.println(habits);

		model.addAttribute("logs", logs);
		model.addAttribute("habit", habits);
		return "viewLogs";
	}

}
