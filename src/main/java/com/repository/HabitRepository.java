package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.HabitEntity;

@Repository
public interface HabitRepository extends JpaRepository<HabitEntity, Integer> {

	List<HabitEntity> findAllByUserId(Integer userId);

	@Query("from HabitEntity where userId = :userId and completed = :status")
	List<HabitEntity> findAllByUserIdAndCompletion(Integer userId, boolean status);

}
