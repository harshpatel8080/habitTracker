<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


	<jsp:include page="admNav.jsp" />

	<div
		class="bg-neutral-900 text-white flex items-center justify-center min-h-screen">

		<div class="bg-neutral-800 shadow-2xl rounded-2xl p-8 w-full max-w-md">
			<h1 class="text-2xl font-bold text-center mb-6">Edit User</h1>

			<form action="adm-updateUser" method="post" class="space-y-4">
				<input type="hidden" name="userId" value="${user.userId}">

				<div>
					<label class="block text-sm font-medium mb-1">First Name:</label> <input
						type="text" name="firstName" value="${user.firstName}"
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Last Name:</label> <input
						type="text" name="lastName" value="${user.lastName}"
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Contact
						Number:</label> <input type="text" name="contactNumber"
						value="${user.contactNumber}"
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Email:</label> <input
						type="email" name="email" value="${user.email}" required
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Gender:</label> <select
						name="gender" required
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
						<c:forEach var="gender" items="${genderTypes}">
							<option value="${gender}"
								${user.gender == gender ? 'selected' : ''}>${gender}</option>
						</c:forEach>
					</select>
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Role:</label> <select
						name="role" required
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500">
						<c:forEach var="role" items="${userTypes}">
							<option value="${role}" ${user.role == role ? 'selected' : ''}>${role}</option>
						</c:forEach>
					</select>
				</div>

				<div>
					<label class="block text-sm font-medium mb-1">Change
						Password:</label> <input type="password" name="password"
						class="w-full p-2 bg-neutral-700 border border-neutral-600 rounded-lg focus:ring-2 focus:ring-blue-500"
						placeholder="Enter new password (optional)">
					<p class="text-xs text-neutral-400 mt-1">Leave blank to keep
						the current password.</p>
				</div>

				<div class="flex justify-center mt-6">
					<button type="submit"
						class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">Update
						User</button>
				</div>
			</form>


		</div>
	</div>

</body>
</html>
