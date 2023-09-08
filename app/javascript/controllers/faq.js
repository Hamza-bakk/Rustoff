  // Sélectionnez tous les éléments avec la classe "question-toggle"
  const questionButtons = document.querySelectorAll('.question-toggle');

  // Parcourez tous les éléments et ajoutez un gestionnaire d'événements clic
  questionButtons.forEach((button) => {
    button.addEventListener('click', () => {
      // Trouvez l'élément de réponse correspondant en utilisant la classe "answer"
      const answer = button.nextElementSibling;

      // Inversez la visibilité de l'élément de réponse
      if (answer.style.display === 'block') {
        answer.style.display = 'none';
      } else {
        answer.style.display = 'block';
      }
    });
  });