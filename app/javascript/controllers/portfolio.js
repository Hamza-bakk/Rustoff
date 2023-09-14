const categoryButtons = document.querySelectorAll('.category-button');


const images = document.querySelectorAll('.category-image');


categoryButtons.forEach(button => {
  button.addEventListener('click', () => {

    const category = button.dataset.category;


    images.forEach(image => {

      if (category === 'all' || image.classList.contains(category)) {
        image.style.display = 'block';
      } else {
        image.style.display = 'none';
      }
    });
  });
});