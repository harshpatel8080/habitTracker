<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Habit Log</title>
<jsp:include page="import.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>


	<jsp:include page="userNav.jsp"></jsp:include>
	<br>
	<div
		class="flex items-center justify-center"
		id="addHabitLogModal">
		<div
			class="bg-white dark:bg-neutral-800 w-3/4 max-w-4xl rounded-xl shadow-2xl p-6">
			<h2
				class="text-center text-2xl font-bold text-neutral-800 dark:text-white mb-6">Add
				Habit Log</h2>

			<form action="savelog" method="post" enctype="multipart/form-data"
				class="space-y-6">
				<!-- Habit Dropdown -->
				<div>
					<label for="habit"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Select
						Habit</label> <select id="habit" name="habitId" onchange="fetchContext()"
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
						<c:forEach var="habit" items="${habits}">
							<option value="${habit.habitId}">${habit.title}</option>
						</c:forEach>
					</select>
				</div>
				<!-- Count with Unit -->
				<div>
					<label for="count"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Count
						<span id="context"
						class="text-sm italic text-gray-500 dark:text-neutral-400">(Unit
							will appear here)</span>
					</label> <input type="number" id="count" name="count" min="1" required
						class="w-full px-4 py-2 bg-white dark:bg-neutral-700 border border-gray-200 dark:border-neutral-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#4A6FFF] dark:text-white">
				</div>


				<!-- Image Upload for Validation -->
				<div>
					<label for="image"
						class="block text-sm font-medium text-neutral-700 dark:text-neutral-300 mb-1">Enter
						Photo for Validation</label> <label for="image"
						class="border-2 border-dashed border-gray-300 dark:border-neutral-600 rounded-lg p-6 h-60 flex flex-col justify-center items-center cursor-pointer hover:bg-neutral-100 dark:hover:bg-neutral-700 text-center">
						<input type="file" id="image" name="image" class="hidden"
						onchange="showFileName()"> <svg
							xmlns="http://www.w3.org/2000/svg"
							class="w-10 h-10 mb-2 text-gray-400" fill="none"
							viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2"
								d="M4 16v2a2 2 0 002 2h12a2 2 0 002-2v-2M16 12l-4-4m0 0l-4 4m4-4v12" />
              </svg>
						<p class="text-sm text-gray-500 dark:text-neutral-400"
							id="fileName">Click to upload</p>
					</label>
				</div>




				<!-- Submit Button -->
				<div class="flex space-x-3 mt-6">
					<button type="submit"
						class="flex-1 py-2 px-4 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] text-white font-medium rounded-lg hover:shadow-lg">Save
						Log</button>
					<a href="#" id="cancelAddHabitLog"
						class="py-2 px-4 bg-gray-200 dark:bg-neutral-700 text-neutral-800 dark:text-white font-medium rounded-lg">Cancel</a>
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
        	console.log(data.context)
          document.getElementById('context').textContent = data.context ? data.context :'';
          console.log(${data.context});
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
