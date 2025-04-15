<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="import.jsp"></jsp:include>
</head>
<body class="bg-neutral-50 dark:bg-neutral-900 flex justify-center items-center min-h-screen">

	<div class="bg-white dark:bg-neutral-700 p-10 rounded-xl shadow-lg w-full max-w-md transform transition duration-500 hover:scale-105">
		<p class="text-red-500 text-center mb-4 font-bold">${err}</p>

		<h2 class="text-3xl font-extrabold text-center text-neutral-800 dark:text-white mb-8">Login</h2>

		<form action="checkcredentials" method="post" class="space-y-6">
			<!-- Email Field -->
			<div>
				<label for="email" class="block text-sm font-medium text-neutral-700 dark:text-white">Email</label>
				<input type="email" id="email" name="email" placeholder="Enter your email" class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
			</div>

			<!-- Password Field -->
			<div>
				<label for="password" class="block text-sm font-medium text-neutral-700 dark:text-white">Password</label>
				<input type="password" id="password" name="password" placeholder="Enter your password" class="w-full px-4 py-3 bg-neutral-100 dark:bg-neutral-800 border border-neutral-300 dark:border-neutral-600 rounded-lg text-neutral-800 dark:text-white focus:ring-2 focus:ring-[#4A6FFF] focus:outline-none">
			</div>

			<!-- Login Button -->
			<button type="submit" class="w-full bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-bold py-3 rounded-lg hover:opacity-90 transition">Login</button>

			<!-- Forgot Password Link -->
			<div class="text-center mt-4">
				<a href="forgotpassword" class="text-sm text-[#4A6FFF] hover:underline">Forgot Password?</a>
			</div>

			<!-- Signup Link -->
			<p class="text-center text-sm text-neutral-600 dark:text-neutral-300 mt-6">
				Don't have an account? <a href="signup" class="text-[#9747FF] hover:underline">Sign up</a>
			</p>
		</form>
	</div>

</body>
</html>