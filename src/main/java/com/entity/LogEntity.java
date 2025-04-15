package com.entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "logs")
public class LogEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer logId;
	private Integer count;
	private Integer habitId;
	private Integer userId;
	private String imgPath;
	private Date loggedAt = new Date();

	@Override
	public String toString() {
		return "LogEntity [logId=" + logId + ", count=" + count + ", habitId=" + habitId + ", userId=" + userId
				+ ", loggedAt=" + loggedAt + "]";
	}

	public Integer getHabitId() {
		return habitId;
	}

	public void setHabitId(Integer habitId) {
		this.habitId = habitId;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Date getLoggedAt() {
		return loggedAt;
	}

	public void setLoggedAt(Date loggedAt) {
		this.loggedAt = loggedAt;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

}
