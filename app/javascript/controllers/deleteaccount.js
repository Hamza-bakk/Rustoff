document.addEventListener("DOMContentLoaded", function() {
  const deleteAccountButton = document.querySelector(".delete-account-button");

  if (deleteAccountButton) {
    deleteAccountButton.addEventListener("click", function(event) {
      const confirmation = confirm("Êtes-vous sûr de vouloir supprimer votre compte ?");

      if (!confirmation) {
        event.preventDefault();
      }
    });
  }
});
