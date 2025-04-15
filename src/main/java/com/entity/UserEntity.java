package com.entity;

import java.util.Date;

import com.enums.GenderType;
import com.enums.UserType;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "users")
@Getter
@Setter
@ToString
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	private String firstName;
	private String lastName;
	private String contactNumber;
	@Column(unique = true)
	private String email;
	private String password;
	private GenderType gender;
	private UserType role = UserType.USER;
	private Date createdAt = new Date();
	private int otp;

	
}
