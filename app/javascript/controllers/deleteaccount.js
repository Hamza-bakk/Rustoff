document.addEventListener("DOMContentLoaded", function() {
    const deleteAccountButton = document.getElementById("delete-account-button");
  
    if (deleteAccountButton) {
      deleteAccountButton.addEventListener("click", function(event) {
        const confirmation = confirm("Are you sure?");
  
        if (!confirmation) {
          event.preventDefault();
        }
      });
    }
  });
  