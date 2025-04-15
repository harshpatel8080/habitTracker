package com.dto;

import java.util.Date;

import com.enums.GenderType;
import com.enums.HabitType;
import com.enums.UserType;

public class ReminderDto {

	private Integer reminderId;
	private Integer habitId;
	private String day;
	private String time;
	private Integer userId;
	private String title;
	private String desciption;
	private Integer duration;
	private Integer catagory;
	private String notes;
	private Boolean reminder;
	private Date createdAt;
	private String firstName;
	private String lastName;
	private Integer contactNumber;
	private String email;
	private String password;
	private Integer gender;
	private Integer role;

	// select * from reminder r , habits h , users u where r.habit_id = h.habit_id
	// and u.user_id = h.user_id;

	public ReminderDto() {
	}

	public ReminderDto(String email, String firstName, GenderType gender, String lastName, 
            String password, UserType role, Integer contactNumber, 
            Integer habitId, HabitType catagory, Date createdAt, 
            String desciption, Integer duration, String notes, 
            String title, Integer userId, Boolean reminder, 
            String day, String time, Integer reminderId) {
this.email = email;
this.firstName = firstName;
//this.gender = gender;
this.lastName = lastName;
this.password = password;
//this.role = role;
this.contactNumber = contactNumber;
this.habitId = habitId;
//this.catagory = catagory;
this.createdAt = createdAt;
this.desciption = desciption;
this.duration = duration;
this.notes = notes;
this.title = title;
this.userId = userId;
this.reminder = reminder;
this.day = day;
this.time = time;
this.reminderId = reminderId;
}

	public void ReminderDto1(String email, String firstName, Integer gender, String lastName, String password, Integer role,
			Integer contactNumber, Integer habitId, Integer catagory, Date createdAt, String desciption,
			Integer duration, String notes, String title, Integer userId, Boolean reminder, String day, String time,
			Integer reminderId) {

		this.reminderId = reminderId;
		this.habitId = habitId;
		this.day = day;
		this.time = time;
		this.userId = userId;
		this.title = title;
		this.desciption = desciption;
		this.duration = duration;
		this.catagory = catagory;
		this.notes = notes;
		this.reminder = reminder;
		this.createdAt = createdAt;
		this.firstName = firstName;
		this.lastName = lastName;
		this.contactNumber = contactNumber;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.role = role;
	}


	public Integer getReminderId() {
		return reminderId;
	}

	public void setReminderId(Integer reminderId) {
		this.reminderId = reminderId;
	}

	public Integer getHabitId() {
		return habitId;
	}

	public void setHabitId(Integer habitId) {
		this.habitId = habitId;
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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Boolean getReminder() {
		return reminder;
	}

	public void setReminder(Boolean reminder) {
		this.reminder = reminder;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Integer getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(Integer contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getCatagory() {
		return catagory;
	}

	public void setCatagory(Integer catagory) {
		this.catagory = catagory;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

}
