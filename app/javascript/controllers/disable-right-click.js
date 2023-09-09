document.addEventListener('DOMContentLoaded', function() {
  $('img').bind('contextmenu', function(e) {
    alert("Dommage bien essayé !")
    return false;
  });
});

