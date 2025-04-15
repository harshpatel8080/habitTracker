<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.enums.HabitType"%>

<html>
<head>
<title>Edit Habit</title>
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

	<br>
	<div class="flex items-center justify-center" id="editHabitModal">
		<div
			class="bg-white dark:bg-neutral-800 w-3/4  rounded-xl shadow-2xl p-6">
			<div class="flex justify-between items-center mb-5">
				<h3 class="text-xl font-bold text-neutral-800 dark:text-white">Edit
					Habit</h3>
				<a href="gethabits?direction=ListHabits"
					class="text-neutral-500 hover:text-neutral-800 dark:hover:text-white"
					id="closeEditModal"> <svg xmlns="http://www.w3.org/2000/svg"
						class="h-6 w-6" fill="none" viewBox="0 0 24 24"
						stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round"
							stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
        </svg>
				</a>
			</div>

			<form id="editHabitForm" class="space-y-4" action="updatehabit"
				method="post">
				<input type="hidden" name="habitId" id="edit-habit-id"
					value="${habit.habitId}"> <input type="hidden"
					name="userId" id="edit-user-id" value="${habit.userId}">

				<div>
					<label for="edit-habit-title"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Habit
						Title</label> <input type="text" name="title" id="edit-habit-title"
						value="${habit.title}"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white"
						required>
				</div>

				<div>
					<label for="edit-habit-description"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Description</label>
					<textarea name="desciption" id="edit-habit-description" rows="3"
						value="${habit.desciption}"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white"></textarea>
				</div>

				<div class="grid grid-cols-2 gap-4">
					<div>
						<label for="edit-habit-duration"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Duration
							(days)</label> <input type="number" name="duration"
							value="${habit.duration}" id="edit-habit-duration"
							class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
					</div>
					<div>
						<label for="edit-habit-count"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Target
							Count</label> <input type="number" name="count" id="edit-habit-count"
							value="${habit.count}"
							class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
					</div>
				</div>

				<div>
					<label for="edit-habit-context"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Unit
						of Context</label> <input type="text" name="context"
						id="edit-habit-context" value="${habit.context}"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
				</div>

				<div>
					<label for="edit-habit-category"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Category</label>
					<select name="catagory" id="edit-habit-category"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
						<c:forEach var="habitType" items="<%=HabitType.values()%>">
							<option value="${habitType}"
								${habit.catagory == habitType ? 'selected' : ''}>
								<c:out value="${habitType}" />
							</option>
						</c:forEach>
					</select>

				</div>

				<div>
					<label for="edit-habit-notes"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Notes</label>
					<textarea name="notes" id="edit-habit-notes" rows="3"
						value="${habit.notes}"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white"></textarea>
				</div>

				<div class="flex items-center space-x-3">
					<label for="edit-habit-reminder"
						class="text-sm text-neutral-700 dark:text-neutral-300">Reminder</label>
					<input type="checkbox" name="reminder" id="edit-habit-reminder"
						class="w-5 h-5" ${habit.reminder ? 'checked' : ''}>
				</div>

				<div class="flex space-x-3 mt-6">
					<button type="submit"
						class="flex-1 py-2 px-4 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-medium rounded-lg hover:shadow-lg">Save
						Changes</button>
					<a href="gethabits?direction=ListHabits" id="cancelEditHabit"
						class="py-2 px-4 bg-gray-200 dark:bg-neutral-700 text-neutral-800 dark:text-white font-medium rounded-lg">Cancel
					</a>
				</div>
			</form>
		</div>
	</div>



</body>
</html>
