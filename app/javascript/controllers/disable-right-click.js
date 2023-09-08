document.addEventListener('DOMContentLoaded', function () {
  // Sélectionnez toutes les balises img sur la page
  const images = document.querySelectorAll('img');

  // Ajoutez un gestionnaire d'événements contextmenu à chaque image
  images.forEach(img => {
      img.addEventListener('contextmenu', (e) => {
          e.preventDefault();
      });
  });
});