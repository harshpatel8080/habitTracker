package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.dto.ReminderDto;
import com.entity.HabitEntity;
import com.entity.ReminderEntity;

import jakarta.transaction.Transactional;

public interface ReminderRepository extends JpaRepository<ReminderEntity, Integer> {

	@Query(value = "select r.* from reminder r , habits h where r.habit_id = h.habit_id and h.reminder = true and day = :day and time = :hour", nativeQuery = true)
	List<ReminderEntity> findAllByDateAndTime(String day, String hour);

	@Query(value = "select u.email from reminder r , users u , habits h where r.habit_id = h.habit_id and u.user_id = h.user_id and r.reminder_id = :reminderId", nativeQuery = true)
	String getEmailByReminderId(Integer reminderId);

	@Query(value = "select h.* from reminder r , users u , habits h where r.habit_id = h.habit_id and u.user_id = h.user_id and r.reminder_id = :reminderId", nativeQuery = true)
	HabitEntity getHabitByReminderId(Integer reminderId);

	List<ReminderEntity> findByHabitId(Integer habitId);

	@Modifying
	@Transactional
	@Query(value = "delete from reminder where habit_id = :habitId", nativeQuery = true)
	void deleteByHabitId(Integer habitId);

}
