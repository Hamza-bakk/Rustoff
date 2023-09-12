const categoryButtons = document.querySelectorAll('.category-button');

// Récupérez toutes les images
const images = document.querySelectorAll('.category-image');

// Ajoutez un gestionnaire d'événements clic à chaque bouton de catégorie
categoryButtons.forEach(button => {
  button.addEventListener('click', () => {
    // Récupérez la catégorie associée au bouton
    const category = button.dataset.category;

    // Parcourez toutes les images
    images.forEach(image => {
      // Vérifiez si l'image a la classe de la catégorie ou si la catégorie est "all"
      if (category === 'all' || image.classList.contains(category)) {
        image.style.display = 'block'; // Affichez l'image
      } else {
        image.style.display = 'none'; // Masquez l'image
      }
    });
  });
});