<element id="ce6670e9-8dff-43fd-adb1-4eb9d7ea2921"
	data-section-id="ce6670e9-8dff-43fd-adb1-4eb9d7ea2921">


<div id="root">
	<header id="header">
		<nav
			class="bg-neutral-900 text-white border-gray-200 px-4 py-2.5 fixed w-full z-50">
			<div
				class="container flex flex-wrap justify-between items-center mx-auto">
				<a href="#hero" class="flex items-center"> <span
					class="self-center text-xl font-semibold whitespace-nowrap text-gradient bg-gradient-to-r from-[#4A6FFF] to-[#9747FF]">HabitTracker</span>
				</a>
				<div class="flex md:order-2">
					<div class="hidden md:flex space-x-2">
						<a href="logout"
							class="py-2 px-4 bg-gradient-to-r from-[#4A6FFF] to-[#9747FF] hover:from-[#4A6FFF] hover:to-[#FF6B6B] text-white font-medium rounded-lg transition-all duration-300">Log
							Out</a>
					</div>
					<button data-collapse-toggle="navbar-sticky" type="button"
						class="inline-flex items-center p-2 text-sm text-white rounded-lg md:hidden focus:outline-none focus:ring-2 focus:ring-gray-200"
						aria-controls="navbar-sticky" aria-expanded="false">
						<span class="sr-only">Open main menu</span>
						<svg class="w-6 h-6" aria-hidden="true" fill="currentColor"
							viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
								d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
								clip-rule="evenodd"></path></svg>
					</button>
				</div>
				<div class="hidden w-full md:block md:w-auto md:order-1"
					id="navbar-sticky">
					<ul
						class="flex flex-col p-4 mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium">
						<li><a href="Home"
							class="block py-2 pr-4 pl-3 text-white border-b border-gray-700 hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 md:dark:hover:text-[#FF6B6B] transition-colors duration-300"
							aria-current="page">Home</a></li>
						<li><a href="addhabit"
							class="flex items-center gap-2 py-2 px-4 text-white border-b border-gray-700 hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 md:dark:hover:text-[#FF6B6B] transition-colors duration-300">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4"
									fill="none" viewBox="0 0 24 24" stroke="currentColor">
  									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="M12 4v16m8-8H4"></path>
									</svg>Habit
						</a></li>
						<li><a href="gethabits?direction=SelectHabit"
							class="flex items-center gap-2 py-2 px-4  text-white border-b border-gray-700 hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 md:dark:hover:text-[#FF6B6B] transition-colors duration-300">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4"
									fill="none" viewBox="0 0 24 24" stroke="currentColor">
  									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="M12 4v16m8-8H4"></path>
									</svg>Reminder
						</a></li>
						<li><a href="gethabits?direction=ListHabits"
							class="block py-2 pr-4 pl-3 text-white border-b border-gray-700 hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 md:dark:hover:text-[#FF6B6B] transition-colors duration-300">
								Habits</a></li>
						<li><a href="gethabits?direction=addLogs"
							class="flex items-center gap-2 py-2 px-4  text-white border-b border-gray-700 hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 md:dark:hover:text-[#FF6B6B] transition-colors duration-300">
								<svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4"
									fill="none" viewBox="0 0 24 24" stroke="currentColor">
  									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="M12 4v16m8-8H4"></path>
									</svg> Log
						</a></li>
						<li><a href="getlogs"
							class="block py-2 pr-4 pl-3 text-white hover:text-[#FF6B6B] md:hover:bg-transparent md:border-0 md:p-0 transition-colors duration-300">
								Logs</a></li>
						<li class="md:hidden"><a href="logout"
							class="block py-2 pr-4 pl-3 text-[#FF6B6B] hover:text-white transition-colors duration-300">Log
								Out</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<br> <br> <br> 

	<script>
    // Mobile menu toggle functionality
    document.addEventListener('DOMContentLoaded', function() {
      const toggleButton = document.querySelector('[data-collapse-toggle="navbar-sticky"]');
      const navbarMenu = document.getElementById('navbar-sticky');
      
      toggleButton.addEventListener('click', function() {
        const expanded = this.getAttribute('aria-expanded') === 'true';
        this.setAttribute('aria-expanded', !expanded);
        navbarMenu.classList.toggle('hidden');
      });

      // Close menu when clicking on a link (mobile)
      const navLinks = document.querySelectorAll('#navbar-sticky a');
      navLinks.forEach(link => {
        link.addEventListener('click', () => {
          if (window.innerWidth < 768) {
            navbarMenu.classList.add('hidden');
            toggleButton.setAttribute('aria-expanded', 'false');
          }
        });
      });
    });
  </script>
</div>

</element>