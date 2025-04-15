package com.component;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dto.ReminderDto;
import com.entity.HabitEntity;
import com.entity.ReminderEntity;
import com.repository.HabitRepository;
import com.repository.ReminderRepository;
import com.repository.UserRepository;
import com.service.MailService;

@Component
public class MyScheduler {

	@Autowired
	ReminderRepository reminderRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	HabitRepository habitRepository;

	@Autowired
	MailService mailService;

	@Scheduled(fixedRate = 1000 * 60 * 60) // Runs every 60 minutes
	@Async // Run this task asynchronously
	public void runTask() {
		if (true) {
			try {

				List<ReminderEntity> reminders = reminderRepository.findAllByDateAndTime(
						LocalDate.now().getDayOfWeek().name(),
						LocalTime.now().format(DateTimeFormatter.ofPattern("HH")) + ":00");
				System.out.println(reminders);
				for (ReminderEntity reminder : reminders) {
					sendReminder(reminder);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

	private void sendReminder(ReminderEntity reminder) {

		String email = reminderRepository.getEmailByReminderId(reminder.getReminderId());
		HabitEntity habit = reminderRepository.getHabitByReminderId(reminder.getReminderId());

		mailService.sendReminderMail(habit, email);
	}

}
