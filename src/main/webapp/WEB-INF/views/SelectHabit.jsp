<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center"
		id="selectHabitModal">
		<div
			class="bg-white dark:bg-neutral-800 w-3/4 max-w-4xl rounded-xl shadow-2xl p-6">
			<p class="text-red-500 text-sm mb-4">${err}</p>

			<form action="selecthabit" method="post" class="space-y-4">
				<div>
					<label for="habitId"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">
						Select a Habit </label> <select name="habitId" id="habitId"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
						<c:forEach items="${habits}" var="h">
							<option value="${h.habitId}">${h.title}</option>
						</c:forEach>
					</select>
				</div>

				<div class="flex space-x-3 mt-6">
					<button type="submit"
						class="flex-1 py-2 px-4 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-medium rounded-lg hover:shadow-lg">
						Select</button>
					<a href="Home" id="cancelSelectHabit"
						class="py-2 px-4 bg-gray-200 dark:bg-neutral-700 text-neutral-800 dark:text-white font-medium rounded-lg">
						Cancel </a>
				</div>
			</form>
		</div>
	</div>

</body>
</html>