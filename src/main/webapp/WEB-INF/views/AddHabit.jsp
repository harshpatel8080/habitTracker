<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.enums.HabitType"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Habit</title>

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


	<div class="flex justify-center items-center min-h-screen">

		<div class="bg-white dark:bg-neutral-800 rounded-xl shadow-md p-8">

			<form action="savehabit" method="post" class="space-y-6">
				<h2
					class="text-center text-xl font-bold text-neutral-800 dark:text-white">Add
					New Habit</h2>

				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label for="title"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Title</label>
						<input type="text" id="title" name="title"
							class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white"
							placeholder="Enter habit title" required>
					</div>

					<div>
						<label for="category"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Category</label>
						<select id="catagory" name="catagory"
							class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white"
							required>
							<%
							for (HabitType type : HabitType.values()) {
							%>
							<option value="<%=type.name()%>"><%=type.name()%></option>
							<%
							}
							%>
						</select>
					</div>
				</div>

				<div>
					<label for="description"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Description</label>
					<textarea id="description" name="description" rows="3"
						class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white resize-none"
						placeholder="Brief description of the habit" required></textarea>
				</div>

				<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
					<div>
						<label for="duration"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Duration
							(days)</label> <input type="number" id="duration" name="duration"
							class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white"
							required>
					</div>

					<div>
						<label for="count"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Target
							Count</label> <input type="number" id="count" name="count"
							placeholder="Eg: 3"
							class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white"
							required>
					</div>

					<div>
						<label for="context"
							class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Unit
							of Count </label> <input type="text" id="context" name="context"
							placeholder="Eg: glass of water"
							class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white"
							required>
					</div>
				</div>

				<div>
					<label for="notes"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Notes</label>
					<textarea id="notes" name="notes" rows="3"
						class="w-full px-4 py-3 bg-neutral-50 dark:bg-neutral-700 border border-neutral-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-neutral-800 dark:text-white resize-none"
						placeholder="Additional notes (optional)"></textarea>
				</div>

				<div class="flex items-center">
					<input type="checkbox" id="reminder" value="true" name="reminder"
						class="h-4 w-4 text-[#4A6FFF] border-gray-300 rounded focus:ring-[#4A6FFF]">
					<label for="reminder"
						class="ml-3 text-sm text-neutral-600 dark:text-neutral-400">Set
						Reminder</label>
				</div>

				<div class="pt-2">
					<button type="submit"
						class="w-full md:w-auto px-6 py-3 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-medium rounded-lg hover:shadow-lg transition-shadow">
						Save Habit</button>
				</div>
			</form>
		</div>

	</div>

</body>
</html>
