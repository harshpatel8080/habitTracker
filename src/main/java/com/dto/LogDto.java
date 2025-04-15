package com.dto;

import java.util.Date;

public class LogDto {
	private Integer logId;
	private Integer count;
	private Integer habitId;
	private Integer userId;
	private Date loggedAt;
	private String title;
	private String context;

	public LogDto(Integer logId, Integer count, Integer habitId, Integer userId, Date loggedAt, String title,
			String context) {
		this.logId = logId;
		this.count = count;
		this.habitId = habitId;
		this.userId = userId;
		this.loggedAt = loggedAt;
		this.title = title;
		this.context = context;
	}

	// Getters and setters
	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getHabitId() {
		return habitId;
	}

	public void setHabitId(Integer habitId) {
		this.habitId = habitId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getLoggedAt() {
		return loggedAt;
	}

	public void setLoggedAt(Date loggedAt) {
		this.loggedAt = loggedAt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}