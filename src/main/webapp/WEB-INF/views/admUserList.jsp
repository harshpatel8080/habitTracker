<%@page import="com.enums.UserType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="admNav.jsp" />
	
	<div
		class="bg-neutral-100 dark:bg-neutral-800 text-neutral-800 dark:text-neutral-300 ">

		<div
			class="bg-white dark:bg-neutral-800 rounded-lg shadow-lg w-full max-w-5xl mx-auto">
			<h1
				class="text-4xl font-bold text-center text-transparent bg-clip-text bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] mb-8">
				Admin Dashboard</h1>

			<!-- User List -->
			<h2 class="text-2xl font-semibold mb-4">User List</h2>
			<input type="text" id="userSearch" onkeyup="searchUser()"
				placeholder="Search users by name..."
				class="w-full p-3 mb-6 border rounded-md dark:bg-neutral-700 dark:border-neutral-600 dark:text-white">

			<div class="overflow-x-auto">
				<table class="w-full text-left border-collapse">
					<thead>
						<tr class="bg-neutral-200 dark:bg-neutral-700">
							<th class="p-3 border dark:border-neutral-600">Username</th>
							<th class="p-3 border dark:border-neutral-600">Email</th>
							<th class="p-3 border dark:border-neutral-600">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<tr
								class="user-row hover:bg-neutral-100 dark:hover:bg-neutral-600">
								<td class="p-3 border dark:border-neutral-600 username">${user.firstName}</td>
								<td class="p-3 border dark:border-neutral-600">${user.email}</td>
								<td class="p-3 border dark:border-neutral-600 flex gap-2">
									<form action="adm-editUser" method="get">
										<input type="hidden" name="userId" value="${user.userId}">
										<button type="submit"
											class="px-4 py-2 bg-yellow-500 text-white rounded-md hover:opacity-90">Edit</button>
									</form>
									<form action="adm-deleteUser" method="post"
										onsubmit="return confirm('Are you sure you want to delete this user?')">
										<input type="hidden" name="userId" value="${user.userId}">
										<button type="submit"
											class="px-4 py-2 bg-red-600 text-white rounded-md hover:opacity-90">Delete</button>
									</form>
									<form action="gethabits" method="get">
										<input type="hidden" name="userId" value="${user.userId}">
										<input type="hidden" name="direction" value="ListHabits">
										<button type="submit"
											class="px-4 py-2 bg-blue-600 text-white rounded-md hover:opacity-90">View
											Habits</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script>
        function searchUser() {
            const input = document.getElementById('userSearch').value.toLowerCase();
            const rows = document.querySelectorAll('.user-row');
            rows.forEach(row => {
                const username = row.querySelector('.username').textContent.toLowerCase();
                row.style.display = username.includes(input) ? '' : 'none';
            });
        }
    </script>

</body>
</html>
