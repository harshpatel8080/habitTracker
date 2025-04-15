package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dto.LogDto;
import com.entity.LogEntity;

@Repository
public interface LogRepository extends JpaRepository<LogEntity, Integer> {

	List<LogEntity> findByUserId(Integer userId);
}
