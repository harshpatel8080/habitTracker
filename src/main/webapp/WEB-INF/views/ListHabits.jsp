<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>List of Habits</title>

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
		class="bg-neutral-50 dark:bg-neutral-900 rounded-xl shadow-lg p-6 md:p-8 mb-16">
		<div
			class="flex flex-col md:flex-row items-center justify-between mb-6">
			<h3
				class="text-2xl font-bold text-neutral-800 dark:text-white mb-4 md:mb-0">All
				Habits</h3>
			<div
				class="flex flex-col md:flex-row items-center gap-4 w-full md:w-auto">
				<input type="text" placeholder="Search habits..."
					class="w-full pl-10 pr-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white"
					oninput="filterHabits()"> <select id="categoryFilter"
					class="appearance-none bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 text-neutral-800 dark:text-white rounded-lg py-2 pl-4 pr-10 cursor-pointer focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] text-sm"
					onchange="filterHabits()">
					<option value="all">All Categories</option>
					<option value="healthy">Healthy</option>
					<option value="learning">Learning</option>
					<option value="productivity">Productivity</option>
					<option value="relationship">Relationship</option>
					<option value="financial">Financial</option>
					<option value="environment">Environment</option>
					<option value="emotional">Emotional</option>
					<option value="creative">Creative</option>
					<option value="leisure">Leisure</option>
				</select>
			</div>
		</div>

		<div id="habitContainer"
			class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
			<c:forEach var="habit" items="${habits}">
				<div
					class="habit-card bg-white dark:bg-neutral-700 rounded-xl shadow-md hover:shadow-lg transition-shadow p-6 border-t-4 animate__animated animate__fadeInUp"
					style="border-top-color: ${habit.catagory == 'healthy' ? '#34D399' : habit.catagory == 'learning' ? '#60A5FA' : habit.catagory == 'productivity' ? '#FBBF24' : habit.catagory == 'relationship' ? '#F472B6' : habit.catagory == 'financial' ? '#EF4444' : habit.catagory == 'environment' ? '#10B981' : habit.catagory == 'emotional' ? '#A78BFA' : habit.catagory == 'creative' ? '#F97316' : habit.catagory == 'leisure' ? '#3B82F6' : '#6B7280'}; color: white;"
					data-category="${habit.catagory}"
					data-title="${habit.title.toLowerCase()}">
					<div class="flex justify-between items-start mb-4">
						<div>
							<span
								class="inline-block px-2 py-1 text-xs rounded-md font-medium"
								style="background-color: ${habit.catagory == 'healthy' ? '#34D399' : habit.catagory == 'learning' ? '#60A5FA' : habit.catagory == 'productivity' ? '#FBBF24' : habit.catagory == 'relationship' ? '#F472B6' : habit.catagory == 'financial' ? '#EF4444' : habit.catagory == 'environment' ? '#10B981' : habit.catagory == 'emotional' ? '#A78BFA' : habit.catagory == 'creative' ? '#F97316' : habit.catagory == 'leisure' ? '#3B82F6' : '#6B7280'}; color: white;">
								${habit.catagory} </span>
							<h3
								class="font-bold text-neutral-800 dark:text-white text-lg mt-2">${habit.title}</h3>
						</div>
						<div class="flex space-x-1">
							<a href="edithabit?habitId=${habit.habitId}"
								class="text-neutral-400 hover:text-[#4A6FFF] transition-colors p-1">✏️</a>
							<a href="deletehabit?habitId=${habit.habitId}"
								onclick="return confirm('Are you sure you want to delete this habit?');"
								class="text-neutral-400 hover:text-red-500 transition-colors p-1">🗑️</a>
							<a href="editreminder?habitId=${habit.habitId}"
								class="text-neutral-400 hover:text-green-500 transition-colors p-1">⏰</a>
						</div>
					</div>
					<p class="text-neutral-800 dark:text-neutral-300 mb-4">${habit.desciption}</p>
					<div class="flex justify-between text-sm">
						<span class="text-[#4A6FFF]">Target: <strong>${habit.count}
								${habit.context}</strong></span> <span class="text-[#9747FF]">Duration: <strong>${habit.duration}
								days</strong></span>
					</div>
					<span class="text-neutral-600 dark:text-neutral-300">Reminder:</span>
					<c:choose>
						<c:when test="${habit.reminder}">
							<span class="text-green-500 font-medium">Yes</span>
						</c:when>
						<c:otherwise>
							<span class="text-red-500 font-medium">No</span>
						</c:otherwise>
					</c:choose>
					<p class="text-neutral-800 dark:text-neutral-300 text-sm mt-2">${habit.notes}</p>
				</div>
			</c:forEach>
		</div>



		<script>
			function filterHabits() {
				const searchQuery = document.querySelector('input[type="text"]').value.toLowerCase();
				const selectedCategory = document.getElementById('categoryFilter').value;
				const habits = document.querySelectorAll('.habit-card');

				habits.forEach(habit => {
					const title = habit.getAttribute('data-title');
					const category = habit.getAttribute('data-category');

					const matchesSearch = title.includes(searchQuery);
					const matchesCategory = selectedCategory === 'all' || category === selectedCategory;

					habit.style.display = matchesSearch && matchesCategory ? 'block' : 'none';
				});
			}
		</script>
	</div>

</body>

</html>
