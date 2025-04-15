package com.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.HabitEntity;
import com.entity.ReminderEntity;
import com.repository.HabitRepository;
import com.repository.ReminderRepository;
import com.repository.UserRepository;

@Controller
public class ReminderController {

	@Autowired
	ReminderRepository reminderRepository;
	@Autowired
	HabitRepository habitRepository;

	@GetMapping("reminderform")
	public String showReminderForm() {
		return "reminderForm";
	}

	@PostMapping("savereminder")
	public String saveReminder(String reminder[], Integer habitId, Model model) {

		System.out.println(habitId);

		Optional<HabitEntity> op = habitRepository.findById(habitId);

		if (op.isPresent()) {
			HabitEntity dbhabit = op.get();
			dbhabit.setReminder(true);
			habitRepository.save(dbhabit);

			for (String r : reminder) {
				System.out.println(r);
				ReminderEntity reminderEntity = new ReminderEntity(habitId, r.split("-")[0], r.split("-")[1]);
				System.out.println(reminderEntity);
				reminderRepository.save(reminderEntity);
			}
			return "Home";
		}
		model.addAttribute("err", "invalid habit");
		return "Error";

	}

	@GetMapping("editreminder")
	public String editReminder(Integer habitId, Model model) {
		Optional<HabitEntity> habit = habitRepository.findById(habitId);

		if (habit.isPresent()) {
			List<ReminderEntity> reminders = reminderRepository.findByHabitId(habitId);
			List<String> selectedReminders = reminders.stream().map(r -> r.getDay() + "-" + r.getTime())
					.collect(Collectors.toList());

			model.addAttribute("habitId", habitId);
			model.addAttribute("selectedReminders", selectedReminders);
			System.out.println(selectedReminders);
			return "reminderForm";
		}
		model.addAttribute("err", "Invalid habit");
		return "Error";
	}

	@PostMapping("updatereminder")
	public String updateReminder(String[] reminder, Integer habitId, Model model) {
		Optional<HabitEntity> habit = habitRepository.findById(habitId);

		if (habit.isPresent()) {
			reminderRepository.deleteByHabitId(habitId); // Clear old reminders

			for (String r : reminder) {
				String[] parts = r.split("-");
				ReminderEntity newReminder = new ReminderEntity(habitId, parts[0], parts[1]);
				reminderRepository.save(newReminder);
			}
			return "redirect:/gethabits?direction=ListHabits";
		}
		model.addAttribute("err", "Invalid habit");
		return "Error";
	}

}
