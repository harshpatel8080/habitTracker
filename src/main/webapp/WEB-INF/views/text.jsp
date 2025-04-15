<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Date"%>
<%@ page import="com.enums.HabitType"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description"
	content="Track, manage and build better habits with our mobile-friendly habit tracker. Simple UI, progress visualization, reminders and more to help you stay consistent with your goals.">
<meta name="theme-color" content="#ffffff">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="">





<title>HabitTracker - Mobile-First Habit Tracking App | Build
	Better Habits</title>
<!-- SEO Description -->
<meta name="description"
	content="Track, manage and build better habits with our mobile-friendly habit tracker. Simple UI, progress visualization, reminders and more to help you stay consistent with your goals.">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- Performance optimization: Preload critical resources -->
<link rel="preload" href="https://cdn.tailwindcss.com" as="script">

<!-- Header Scripts -->
<script id="header-scripts">
        // This script tag will be replaced with actual scripts.head content
        if (window.scripts && window.scripts.head) {
          document.getElementById('header-scripts').outerHTML = window.scripts.head;
        }
      </script>

<!-- Preconnect -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Font stylesheet -->

<script type="application/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js"></script>

<!-- Core CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<script>
      // render the settings object
      //console.log('settings', [object Object]);
      document.addEventListener('DOMContentLoaded', function() {
        tailwind.config = {
          theme: {
            extend: {
              colors: {
                primary: {
                  DEFAULT: '#4A6FFF',
                  50: '#f8f8f8',
                  100: '#e8e8e8', 
                  200: '#d3d3d3',
                  300: '#a3a3a3',
                  400: '#737373',
                  500: '#525252',
                  600: '#404040',
                  700: '#262626',
                  800: '#171717',
                  900: '#0a0a0a',
                  950: '#030303',
                },
                secondary: {
                  DEFAULT: '#9747FF',
                  50: '#f8f8f8',
                  100: '#e8e8e8',
                  200: '#d3d3d3', 
                  300: '#a3a3a3',
                  400: '#737373',
                  500: '#525252',
                  600: '#404040',
                  700: '#262626',
                  800: '#171717',
                  900: '#0a0a0a',
                  950: '#030303',
                },
                accent: {
                  DEFAULT: '',
                  50: '#f8f8f8',
                  100: '#e8e8e8',
                  200: '#d3d3d3',
                  300: '#a3a3a3', 
                  400: '#737373',
                  500: '#525252',
                  600: '#404040',
                  700: '#262626',
                  800: '#171717',
                  900: '#0a0a0a',
                  950: '#030303',
                },
              },
              fontFamily: {
                sans: ['Poppins, sans-serif', 'Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Helvetica Neue', 'Arial', 'sans-serif'],
                heading: ['Inter, sans-serif', 'Inter', 'system-ui', 'sans-serif'],
                body: ['Inter, sans-serif', 'Inter', 'system-ui', 'sans-serif'],
              },
              spacing: {
                '18': '4.5rem',
                '22': '5.5rem',
                '30': '7.5rem',
              },
              maxWidth: {
                '8xl': '88rem',
                '9xl': '96rem',
              },
              animation: {
                'fade-in': 'fadeIn 0.5s ease-in',
                'fade-out': 'fadeOut 0.5s ease-out',
                'slide-up': 'slideUp 0.5s ease-out',
                'slide-down': 'slideDown 0.5s ease-out',
                'slide-left': 'slideLeft 0.5s ease-out',
                'slide-right': 'slideRight 0.5s ease-out',
                'scale-in': 'scaleIn 0.5s ease-out',
                'scale-out': 'scaleOut 0.5s ease-out',
                'spin-slow': 'spin 3s linear infinite',
                'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                'bounce-slow': 'bounce 3s infinite',
                'float': 'float 3s ease-in-out infinite',
              },
              keyframes: {
                fadeIn: {
                  '0%': { opacity: '0' },
                  '100%': { opacity: '1' },
                },
                fadeOut: {
                  '0%': { opacity: '1' },
                  '100%': { opacity: '0' },
                },
                slideUp: {
                  '0%': { transform: 'translateY(20px)', opacity: '0' },
                  '100%': { transform: 'translateY(0)', opacity: '1' },
                },
                slideDown: {
                  '0%': { transform: 'translateY(-20px)', opacity: '0' },
                  '100%': { transform: 'translateY(0)', opacity: '1' },
                },
                slideLeft: {
                  '0%': { transform: 'translateX(20px)', opacity: '0' },
                  '100%': { transform: 'translateX(0)', opacity: '1' },
                },
                slideRight: {
                  '0%': { transform: 'translateX(-20px)', opacity: '0' },
                  '100%': { transform: 'translateX(0)', opacity: '1' },
                },
                scaleIn: {
                  '0%': { transform: 'scale(0.9)', opacity: '0' },
                  '100%': { transform: 'scale(1)', opacity: '1' },
                },
                scaleOut: {
                  '0%': { transform: 'scale(1.1)', opacity: '0' },
                  '100%': { transform: 'scale(1)', opacity: '1' },
                },
                float: {
                  '0%, 100%': { transform: 'translateY(0)' },
                  '50%': { transform: 'translateY(-10px)' },
                },
              },
              aspectRatio: {
                'portrait': '3/4',
                'landscape': '4/3',
                'ultrawide': '21/9',
              },
            },
          },
          variants: {
            extend: {
              opacity: ['disabled'],
              cursor: ['disabled'],
              backgroundColor: ['active', 'disabled'],
              textColor: ['active', 'disabled'],
            },
          },
        }
      });
      </script>

<!-- Utilities and Components -->
<script defer
	src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.3/cdn.min.js"></script>
<script defer
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.45.1/apexcharts.min.js"></script>

<!-- Optimized Font Loading -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!-- Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Dynamic Meta Tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="robots" content="">
<meta name="google-site-verification" content="">
<meta name="baidu-verification" content="">
<meta name="yandex-verification" content="">
<meta name="bing-verification" content="">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:image" content="">
<meta property="og:type" content="website">
<meta property="og:locale" content="en_US">
<meta property="og:site_name" content="HabitTracker">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="">
<meta name="twitter:description" content="">
<meta name="twitter:image" content="">


<!-- Font Links -->

<link rel="icon" type="image/x-icon" href="">

<style>
h1, h2, h3, h4, h5, h6 {
	font-family: Poppins, sans-serif, Inter, system-ui, sans-serif;
}

body {
	font-family: Inter, sans-serif, Inter, system-ui, sans-serif;
}
</style>
</head>


<body>
	<jsp:include page="userNav.jsp"></jsp:include>

	<div
		class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center"
		id="addHabitLogModal">
		<div
			class="bg-white dark:bg-neutral-800 w-3/4 max-w-4xl rounded-xl shadow-2xl p-6">
			<h2
				class="text-center text-2xl font-bold text-neutral-800 dark:text-white mb-6">
				Add Habit Log</h2>

			<form action="savelog" method="post" enctype="multipart/form-data"
				class="space-y-6">
				<!-- Habit Dropdown -->
				<div>
					<label for="habit"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">
						Select Habit </label> <select id="habit" name="habitId"
						onchange="fetchContext()"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
						<c:forEach var="habit" items="${habits}">
							<option value="${habit.habitId}">${habit.title}</option>
						</c:forEach>
					</select>
				</div>

				<!-- Image Upload (Optional) -->
				<div>
					<label for="image"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">
						Habit Image (Optional)
						<div
							class="border-2 border-dashed border-gray-300 dark:border-neutral-600 rounded-lg p-6 flex justify-center items-center cursor-pointer hover:bg-neutral-100 dark:hover:bg-neutral-700">
							<input type="file" id="image" name="image" class="hidden"
								onchange="showFileName()">
							<div class="text-center">
								<svg xmlns="http://www.w3.org/2000/svg"
									class="w-10 h-10 mb-2 text-gray-400" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
  									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M4 16v2a2 2 0 002 2h12a2 2 0 002-2v-2M16 12l-4-4m0 0l-4 4m4-4v12" />
								</svg>

								<p class="text-sm text-gray-500 dark:text-neutral-400"
									id="fileName">Click to upload</p>
							</div>
					</label>
				</div>
		</div>

		<!-- Count with Unit -->
		<div>
			<label for="count"
				class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">
				Count <span id="context"
				class="text-sm italic text-gray-500 dark:text-neutral-400">(Unit
					will appear here)</span>
			</label> <input type="number" id="count" name="count" min="1" required
				class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
		</div>

		<!-- Submit Button -->
		<div class="flex space-x-3 mt-6">
			<button type="submit"
				class="flex-1 py-2 px-4 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-medium rounded-lg hover:shadow-lg">
				Save Log</button>
			<a href="#" id="cancelAddHabitLog"
				class="py-2 px-4 bg-gray-200 dark:bg-neutral-700 text-neutral-800 dark:text-white font-medium rounded-lg">
				Cancel </a>
		</div>
		</form>
	</div>
	</div>

	<script>
  function fetchContext() {
    const habitId = document.getElementById('habit').value;
    fetch(`/getHabitContext?habitId=` + habitId)
      .then(response => response.json())
      .then(data => {
        document.getElementById('context').textContent = data.context ? `(${data.context})` : '(Unit will appear here)';
      })
      .catch(error => console.error('Error fetching context:', error));
  }

  function showFileName() {
    const fileInput = document.getElementById('image');
    const fileNameDisplay = document.getElementById('fileName');
    fileNameDisplay.textContent = fileInput.files.length > 0 ? fileInput.files[0].name : 'Click to upload';
  }
</script>

</body>
</html>