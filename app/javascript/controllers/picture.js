

document.addEventListener('DOMContentLoaded', function () {
    const mobileMenuButton = document.querySelector('[aria-controls="mobile-menu"]');
    const mobileMenu = document.getElementById('mobile-menu');
  
    mobileMenuButton.addEventListener('click', function () {
      const expanded = mobileMenuButton.getAttribute('aria-expanded') === 'true' || false;
      mobileMenuButton.setAttribute('aria-expanded', !expanded);
      mobileMenu.classList.toggle('hidden');
    });
  });
  

document.addEventListener('contextmenu', function(e) {
    if (e.target.tagName === 'IMG') {
    }
  });
  console.log("je suis dans picture")