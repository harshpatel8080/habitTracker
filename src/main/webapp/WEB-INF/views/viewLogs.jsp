<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Logs and Habits</title>
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
	<div class="dark:bg-neutral-800  shadow-md ">

		<div class="pt-1">
			<h1 class="text-4xl font-extrabold text-center my-8  text-[#4A6FFF]">

				User Logs and Habits</h1>

			<div
				class="max-w-4xl mx-auto bg-white dark:bg-neutral-900 rounded-3xl shadow-2xl p-8">
				<div class="space-y-4">
					<c:forEach var="log" items="${logs}">
						<c:set var="matchedHabit" value="" />
						<c:set var="habitContext" value="" />

						<c:forEach var="habit" items="${habit}">
							<c:if test="${habit.habitId == log.habitId}">
								<c:set var="matchedHabit" value="${habit.title}" />
								<c:set var="habitContext" value="${habit.context}" />
							</c:if>
						</c:forEach>

						<div
							class="bg-[#3F3F3F] rounded-xl shadow-md p-5 flex items-center gap-4 border-l-8 border-[#4A6FFF]">
							<div class="flex-1">
								<p class="text-xl font-bold text-neutral-800 dark:text-white">
									${log.count} (${habitContext})</p>
								<p class="text-sm text-[#9747FF] mt-1">
									<fmt:parseDate var="parsedDate" value="${log.loggedAt}"
										pattern="yyyy-MM-dd HH:mm:ss.SSS" />
									<fmt:formatDate value="${parsedDate}"
										pattern="h:mm a EEEE dd/MM/yy" />
								</p>
								<p class="text-md text-neutral-600 dark:text-neutral-300 mt-2">
									Habit: <strong>${matchedHabit}</strong>
								</p>
							</div>

							<c:if test="${not empty log.imgPath}">
								<div
									class="w-20 h-20 rounded-lg overflow-hidden border-2 border-neutral-300">
									<img src="${log.imgPath}" alt="${matchedHabit}"
										class="w-full h-full object-cover" />
								</div>
							</c:if>

							<form action="habitDetails" method="get" class="self-start">
								<input type="hidden" name="habitId" value="${log.habitId}">
								<button type="submit"
									class="p-2 bg-[#4A6FFF] rounded-full shadow-md hover:scale-110 transition-transform">
									<svg class="w-5 h-5 text-white" fill="none"
										stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
										xmlns="http://www.w3.org/2000/svg">
									  <path stroke-linecap="round" stroke-linejoin="round"
											d="M9 2h6a2 2 0 0 1 2 2v1h2a1 1 0 0 1 1 1v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a1 1 0 0 1 1-1h2V4a2 2 0 0 1 2-2z" />
										<path stroke-linecap="round" stroke-linejoin="round"
											d="M9 4h6" />
											  <path stroke-linecap="round" stroke-linejoin="round"
											d="M8 10h8M8 14h8M8 18h4" />
									</svg>

								</button>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
