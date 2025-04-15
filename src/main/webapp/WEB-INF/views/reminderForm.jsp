<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Weekly Schedule</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body class="bg-gray-100 dark:bg-neutral-900">
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


	<div class="max-w-5xl mx-auto px-4 py-8">
		<h2
			class="text-center text-2xl font-bold mb-4 text-neutral-800 dark:text-white">Weekly
			Schedule</h2>
		<form action="/updatereminder" method="post">
			<div class="overflow-x-auto">
				<table class="w-full border-collapse">
					<thead class="bg-neutral-800 text-white">
						<tr>
							<th class="border border-neutral-600 p-2"></th>
							<th class="border border-neutral-600 p-2">Mon</th>
							<th class="border border-neutral-600 p-2">Tue</th>
							<th class="border border-neutral-600 p-2">Wed</th>
							<th class="border border-neutral-600 p-2">Thu</th>
							<th class="border border-neutral-600 p-2">Fri</th>
							<th class="border border-neutral-600 p-2">Sat</th>
							<th class="border border-neutral-600 p-2">Sun</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="days"
							value="MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY" />
						<c:set var="dayList" value="${days.split(',')}" />
						<c:forEach var="hour" begin="0" end="23">
							<tr>
								<td
									class="bg-neutral-200 border border-neutral-600 p-2 w-24 text-right text-sm font-bold text-neutral-800">
									<c:choose>
										<c:when test="${hour == 0}">
											12:00 AM
										</c:when>
										<c:when test="${hour == 12}">
											12:00 PM
										</c:when>
										<c:when test="${hour lt 12}">
											${String.format("%02d:00 AM", hour)}
										</c:when>
										<c:otherwise>
											${String.format("%02d:00 PM", hour - 12)}
										</c:otherwise>
									</c:choose>
								</td>
								<c:forEach var="day" items="${dayList}">
									<c:set var="timeSlot"
										value="${day}-${String.format('%02d:00', hour)}" />
									<td class="p-0 border border-neutral-600"><label
										for="${day}-${hour}"
										class="w-full h-12 time-slot bg-neutral-100 dark:bg-neutral-700 hover:bg-neutral-200 dark:hover:bg-neutral-600 transition-colors cursor-pointer flex items-center justify-center select-none">
											<input type="checkbox" id="${day}-${hour}" name="reminder"
											value="${day}-${String.format('%02d:00', hour)}"
											<c:if test="${selectedReminders.contains(timeSlot)}">checked</c:if>
											class="hidden">
									</label></td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<input type="hidden" name="habitId" value="${habitId}">
			<button type="submit"
				class="w-full mt-4 px-4 py-2 bg-[#4A6FFF] text-white font-semibold rounded-lg hover:bg-[#3B5BFF] transition-colors">
				Save Reminders</button>
		</form>
	</div>

	<script>
	document.addEventListener('DOMContentLoaded', () => {
	    document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
	        const label = checkbox.closest('label');
	        if (checkbox.checked) {
	            label.classList.remove('bg-neutral-100', 'hover:bg-neutral-200', 'dark:bg-neutral-700', 'dark:hover:bg-neutral-600');
	            label.classList.add('bg-[#4A6FFF]');
	        }

	        checkbox.addEventListener('change', function() {
	            if (this.checked) {
	                label.classList.remove('bg-neutral-100', 'hover:bg-neutral-200', 'dark:bg-neutral-700', 'dark:hover:bg-neutral-600');
	                label.classList.add('bg-[#4A6FFF]');
	            } else {
	                label.classList.remove('bg-[#4A6FFF]');
	                label.classList.add('bg-neutral-100', 'hover:bg-neutral-200', 'dark:bg-neutral-700', 'dark:hover:bg-neutral-600');
	            }
	        });
	    });
	});

	</script>
</body>
</html>