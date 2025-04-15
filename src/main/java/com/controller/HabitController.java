package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.entity.HabitEntity;
import com.entity.UserEntity;
import com.enums.HabitType;
import com.repository.HabitRepository;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HabitController {

	@Autowired
	HabitRepository habitRepository;
	@Autowired
	UserRepository userRepository;

	@GetMapping("addhabit")
	public String showAddHabitForm() {
		return "AddHabit";
	}

	@PostMapping("savehabit")
	public String saveHabit(HabitEntity habitEntity, HttpSession session, Model model) {

		if (habitEntity.getReminder() == null) {
			habitEntity.setReminder(false);
		}

		UserEntity userEntity = (UserEntity) session.getAttribute("user");
		habitEntity.setUserId(userEntity.getUserId());

		habitEntity = habitRepository.save(habitEntity);

		System.out.println(habitEntity);

		if (habitEntity.getReminder()) {
			model.addAttribute("habitId", habitEntity.getHabitId());
			return "reminderForm";
		} else {
			return "Home";
		}
	}

	@GetMapping("gethabits")
	public String getHabits(Model model, HttpSession session, String direction, Integer userId, String status) {

		if (userId == null) {
			UserEntity userEntity = (UserEntity) session.getAttribute("user");
			userId = userEntity.getUserId();
		} else {
			Optional<UserEntity> op = userRepository.findById(userId);
			if (op.isPresent()) {
				session.setAttribute("user", op.get());
			} else {
				model.addAttribute("status", 404);
				model.addAttribute("err", "No user Found");
				return "Error";
			}
		}

		List<HabitEntity> habits = habitRepository.findAllByUserIdAndCompletion(userId,
				status == "true" ? true : false);
		System.out.println(habits);
		model.addAttribute("habits", habits);

		return direction;
	}

	@PostMapping("selecthabit")
	public String selectHabit(Integer habitId, Model model) {
		return "redirect:/editreminder?habitId=" + habitId;
	}

	@GetMapping("edithabit")
	public String showEditForm(Integer habitId, Model model) {
		Optional<HabitEntity> op = habitRepository.findById(habitId);
		if (op.isPresent()) {
			HabitEntity dbHabit = op.get();
			model.addAttribute("habit", dbHabit);
			model.addAttribute("habitTypes", HabitType.values());
			return "editHabit";
		}
		model.addAttribute("status", 404);
		model.addAttribute("err", "No Habit Found");
		return "Error";
	}

	@PostMapping("updatehabit")
	public String updateHabit(HabitEntity habit, Model model) {

		System.out.println("------------------------------------------------------------" + habit.getHabitId());
		Optional<HabitEntity> op = habitRepository.findById(habit.getHabitId());

		if (op.isPresent()) {

			HabitEntity dbHabit = op.get();
			dbHabit.setTitle(habit.getTitle());
			dbHabit.setCatagory(habit.getCatagory());
			dbHabit.setDesciption(habit.getDesciption());
			dbHabit.setDuration(habit.getDuration());
			dbHabit.setNotes(habit.getNotes());
			dbHabit.setReminder(habit.getReminder());
			dbHabit.setCount(habit.getCount());
			dbHabit.setContext(habit.getContext());
			habitRepository.save(dbHabit);

			return "redirect:/gethabits?direction=ListHabits";
		}

		model.addAttribute("status", 404);
		model.addAttribute("err", "No Habit Found");
		return "Error";
	}

	@GetMapping("/deletehabit")
	public String deleteHabit(Integer habitId) {
		habitRepository.deleteById(habitId);
		return "redirect:/gethabits?direction=ListHabits";
	}

	@GetMapping("getHabitContext")
	@ResponseBody
	public Map<String, String> getHabitContext(Integer habitId) {
		System.out.println(habitId);
		Optional<HabitEntity> habit = habitRepository.findById(habitId);
		System.out.println(habit.get().getContext());
		Map<String, String> response = new HashMap<>();
		response.put("context", habit.map(HabitEntity::getContext).orElse(""));
		return response;
	}

	@GetMapping("habitDetails")
	public String habitDetails(Integer habitId, Model model) {
		HabitEntity habit = habitRepository.findById(habitId).orElse(null);
		model.addAttribute("habit", habit);
		return "habitDetails";
	}

	@GetMapping("test")
	public String text() {
		return "text";
	}

}
