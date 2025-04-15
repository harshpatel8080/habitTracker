package com.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "reminder")
public class ReminderEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reminderId;	
	private Integer habitId;
	private String day;
	private String time;

	public ReminderEntity(Integer habitId, String day, String time) {
		this.habitId = habitId;
		this.day = day;
		this.time = time;
	}

	public ReminderEntity() {
	}

	public Integer getHabitId() {
		return habitId;
	}

	public void setHabitId(Integer habitId) {
		this.habitId = habitId;
	}

	public Integer getReminderId() {
		return reminderId;
	}

	public void setReminderId(Integer reminderId) {
		this.reminderId = reminderId;
	}

	@Override
	public String toString() {
		return "ReminderEntity [reminderId=" + reminderId + ", habitId=" + habitId + ", day=" + day + ", time="
				+ getTime() + "]";
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
