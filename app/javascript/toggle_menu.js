document.addEventListener("turbo:load", function () {
  const toggleMenu = document.getElementById("toggle_menu");
  const menuOptions = document.getElementById("menu_options");
  const overlay = document.querySelector('.overlay');
  const mainElement = document.querySelector('main');
  const toggleMenuHidden = document.querySelector('.toggle-menu-hidden');

  // Check if the event listener is already attached
  if (!toggleMenu.classList.contains("menu-listener-attached")) {
    toggleMenu.addEventListener("click", function () {
      menuOptions.classList.toggle("hidden");
      menuOptions.classList.toggle('toggle-menu-hidden');
      overlay.classList.toggle('hidden');

      // Set the width of toggle-menu-hidden
      if (menuOptions.classList.contains('toggle-menu-hidden')) {
        toggleMenuHidden.style.width = '0';
      } else {
        toggleMenuHidden.style.width = `${mainElement.offsetWidth}px`;
      }
    });

    // Add a class to mark that the event listener is attached
    toggleMenu.classList.add("menu-listener-attached");
  }
});
