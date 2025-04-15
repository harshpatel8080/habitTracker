package com.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

import com.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
public class SessionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		List<String> publicURL = Arrays.asList("SignUp.jsp", "Login.jsp", "/signup", "/forgotpassword",
				"/resetpassword", "/saveuser", "/checkcredentials", "/sendtoken", "/changepassword", "Error.jsp",
				"ForgotPassword.jsp", "ResetPassword.jsp", "text.jsp");

		HttpServletRequest req = (HttpServletRequest) request;

		String uri = req.getRequestURI();

		System.out.println("Filter Call....." + uri);

		if (publicURL.contains(uri) || uri.contains(".css") || uri.contains(".js")) {
			chain.doFilter(request, response);// go ahead
		} else {
			HttpSession session = req.getSession();
			UserEntity user = (UserEntity) session.getAttribute("user");

			if (user == null) {
				req.getRequestDispatcher("login").forward(request, response);
			} else {
				chain.doFilter(request, response);
			}
		}

	}

}
