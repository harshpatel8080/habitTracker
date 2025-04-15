package com.entity;

import java.util.Date;

import com.enums.HabitType;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "habits")
@FieldDefaults(level = AccessLevel.PRIVATE)
@Getter
@Setter
@ToString
public class HabitEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer habitId;
	Integer userId;
	String title;
	String desciption;
	Integer duration;
	HabitType catagory;
	String notes;
	Boolean reminder;
	Integer count;
	String context;
	Boolean completed = false;
	Date createdAt = new Date();

}
