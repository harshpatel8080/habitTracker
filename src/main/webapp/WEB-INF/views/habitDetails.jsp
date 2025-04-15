<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Habit Details</title>
<!-- Tailwind CSS -->

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
		class="flex justify-center items-center min-h-screen bg-neutral-100 dark:bg-neutral-900">

		<div
			class="bg-white dark:bg-neutral-800 p-8 rounded-lg shadow-lg w-full max-w-xl">
			<h1
				class="text-3xl font-bold text-center text-transparent bg-clip-text bg-gradient-to-r from-[#FF416C] to-[#FF4B2B] mb-6">
				Habit Details</h1>

			<!-- Habit details -->
			<div class="space-y-4">
				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Title:</label>
					<span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.title}</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Description:</label>
					<span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.desciption}</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Category:</label>
					<span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.catagory}</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Duration
						(in days):</label> <span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.duration}</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Target
						Count:</label> <span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.count}
						(${habit.context})</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Notes:</label>
					<span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">${habit.notes}</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Reminder
						Set:</label> <span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">
						<c:choose>
							<c:when test="${habit.reminder}">Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>
					</span>
				</div>

				<div>
					<label
						class="block font-semibold text-neutral-800 dark:text-neutral-300">Created
						At:</label> <span
						class="block bg-neutral-100 dark:bg-neutral-700 p-3 rounded-md text-neutral-700 dark:text-white">
						<fmt:formatDate value="${habit.createdAt}"
							pattern="h:mm a EEEE dd/MM/yy" />
					</span>
				</div>
			</div>

			<!-- Back Button -->
			<a href="getlogs"
				class="block text-center mt-8 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-semibold py-3 rounded-md hover:opacity-90 transition">
				Back to Logs </a>
		</div>
	</div>
</body>
</html>
