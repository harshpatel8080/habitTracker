<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body>

	<%
	UserType role = (UserType) session.getAttribute("role");
	%>

	<%
	if (role == UserType.ADMIN) {
	%>
	<jsp:include page="admNav.jsp" />
	<%
	} else {
	%>
	<jsp:include page="userNav.jsp" />
	<%
	}
	%>

	<div
		class="bg-neutral-50 dark:bg-neutral-900 flex justify-center items-center min-h-screen">
		<div
			class="bg-white dark:bg-neutral-700 p-10 rounded-xl shadow-lg w-full max-w-md transform transition duration-500 hover:scale-105">

			<h1
				class="text-6xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-[#FF416C] to-[#FF4B2B] text-center mb-6">
				Oops!</h1>

			<p class="text-lg text-neutral-700 dark:text-white text-center mb-6">
				Something went wrong. Please try again later.</p>

			<!-- Error Details -->
			<div class="bg-neutral-100 dark:bg-neutral-800 p-4 rounded-lg mb-6">
				<p class="text-neutral-600 dark:text-neutral-400 text-sm">
					<strong>Error Code:</strong> <span class="text-red-500">${status}</span>
				</p>
				<p class="text-neutral-600 dark:text-neutral-400 text-sm">
					<strong>Message:</strong> <span class="text-red-500">${err}</span>
				</p>
			</div>

			<!-- Back to Home Button -->
			<a href="<%=request.getContextPath()%>/"
				class="block text-center bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-bold py-3 rounded-lg hover:opacity-90 transition">
				Go Back Home </a>
		</div>
	</div>
</body>
</html>
