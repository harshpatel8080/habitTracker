<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add New User</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="admNav.jsp" />
	<div
		class="bg-gray-900 text-white flex items-center justify-center min-h-screen">

		<div class="bg-gray-800 shadow-lg rounded-lg p-8 w-full max-w-md">
			<h1 class="text-2xl font-bold text-center mb-6">Add New User</h1>

			<form action="addUser" method="post" class="space-y-4">
				<!-- First Name -->
				<div>
					<label for="firstName"
						class="block text-sm font-medium text-neutral-700 dark:text-white">First
						Name</label> <input type="text" id="firstName" name="firstName"
						placeholder="Enter your first name" required
						class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
				</div>

				<!-- Last Name -->
				<div>
					<label for="lastName"
						class="block text-sm font-medium text-neutral-700 dark:text-white">Last
						Name</label> <input type="text" id="lastName" name="lastName"
						placeholder="Enter your last name" required
						class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
				</div>

				<!-- Gender -->
				<div>
					<label
						class="block text-sm font-medium text-neutral-700 dark:text-white">Gender</label>
					<div class="flex space-x-4 mt-2">
						<label class="flex items-center"> <input type="radio"
							name="gender" value="MALE" required
							class="text-[#4A6FFF] focus:ring-[#4A6FFF]"> <span
							class="ml-2 text-neutral-800 dark:text-white">Male</span>
						</label> <label class="flex items-center"> <input type="radio"
							name="gender" value="FEMALE"
							class="text-[#4A6FFF] focus:ring-[#4A6FFF]"> <span
							class="ml-2 text-neutral-800 dark:text-white">Female</span>
						</label> <label class="flex items-center"> <input type="radio"
							name="gender" value="OTHER"
							class="text-[#4A6FFF] focus:ring-[#4A6FFF]"> <span
							class="ml-2 text-neutral-800 dark:text-white">Other</span>
						</label>
					</div>
				</div>

				<!-- Email -->
				<div>
					<label for="email"
						class="block text-sm font-medium text-neutral-700 dark:text-white">Email</label>
					<input type="email" id="email" name="email"
						placeholder="Enter your email" required
						class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
				</div>

				<!-- Password -->
				<div>
					<label for="password"
						class="block text-sm font-medium text-neutral-700 dark:text-white">Password</label>
					<input type="password" id="password" name="password"
						placeholder="Enter your password" required
						class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
				</div>

				<!-- Role -->
				<div>
					<label for="role"
						class="block text-sm font-medium text-neutral-700 dark:text-white">
						Role </label> <select id="role" name="role" required
						class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 
                               border border-neutral-300 dark:border-neutral-600 
                               rounded-lg text-neutral-800 dark:text-white 
                               focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
						<c:forEach var="role" items="${userTypes}">
							<option value="${role}">${role}</option>
						</c:forEach>
					</select>
				</div>

				<div class="flex justify-center">
					<button type="submit"
						class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
						Add User</button>
				</div>
			</form>


		</div>
	</div>

</body>
</html>
