// Lorsque vous cliquez sur '.Twitch', masquez les éléments avec la classe '.shop-card' sauf ceux avec 'data-cat="Twitch"'
$('.Twitch').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Twitch"]').show(300);
});

// Lorsque vous cliquez sur '.3D', masquez les éléments avec la classe '.shop-card' sauf ceux avec 'data-cat="3D"'
$('.3D').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="3D"]').show(300);
});

// Lorsque vous cliquez sur '.Animation', masquez les éléments avec la classe '.shop-card' sauf ceux avec 'data-cat="Animation"'
$('.Animation').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Animation"]').show(300);
});

// Lorsque vous cliquez sur '.Logo', masquez les éléments avec la classe '.shop-card' sauf ceux avec 'data-cat="Logo"'
$('.Logo').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Logo"]').show(300);
});

// Ajoutez ici les gestionnaires de clic pour toutes les autres catégories de la même manière
$('.Merch').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Merch"]').show(300);
});

$('.Tattoo').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Tattoo"]').show(300);
});

$('.Illustrations').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Illustrations"]').show(300);
});

$('.Divers').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Divers"]').show(300);
});

$('.Avatars').on('click', function (e) {
  console.log('Cliquez sur la catégorie Avatars'); // Ajoutez ceci pour déboguer

  $('.shop-card').hide(300);
  $('*[data-cat="Avatars"]').show(300);
});

$('.Autres').on('click', function (e) {
  $('.shop-card').hide(300);
  $('*[data-cat="Autres"]').show(300);
});

$(document).ready(function() {
  $('.menu-item').on('click', function() {
    const category = $(this).attr('class').split(' ')[1]; // Obtient la classe de la catégorie
    filterItems(category);
  });

  function filterItems(category) {
    if (category === 'All') {
      $('.shop-card').fadeIn(0); // Affiche toutes les cartes avec une animation de fondu
    } else {
      $('.shop-card').fadeOut(0, function() {
        $(`.shop-card[data-cat="${category}"]`).fadeIn(0);
      });
    }
  }
});

