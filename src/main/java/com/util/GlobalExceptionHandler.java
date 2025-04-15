package com.util;

import java.time.LocalDateTime;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(Exception.class)
	public ModelAndView handleRuntimeException(Exception exception, Model model) {
		ModelAndView mav = new ModelAndView("Error");
		mav.addObject("err", exception.getMessage());
		return mav;
	}
}
