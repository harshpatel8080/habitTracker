<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body
	class="bg-neutral-50 dark:bg-neutral-900 flex justify-center items-center min-h-screen">

	<div
		class="bg-white dark:bg-neutral-700 p-10 rounded-xl shadow-lg w-full max-w-md transform transition duration-500 hover:scale-105">
		<p class="text-red-500 text-center mb-4 font-bold">${err}</p>

		<h2
			class="text-3xl font-extrabold text-center text-neutral-800 dark:text-white mb-8">Create
			Your Account</h2>

		<form action="saveuser" method="post" class="space-y-6">
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

			<!-- Signup Button -->
			<button type="submit"
				class="w-full bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-bold py-3 rounded-lg hover:opacity-90 transition">Sign
				Up</button>

			<!-- Login Link -->
			<p
				class="text-center text-sm text-neutral-600 dark:text-neutral-300 mt-6">
				Already have an account? <a href="login"
					class="text-[#9747FF] hover:underline">Login</a>
			</p>
		</form>
	</div>

</body>
</html>