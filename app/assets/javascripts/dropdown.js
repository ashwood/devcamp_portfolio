$( document ).ready(function( $ ) {
  $(document).on('turbolinks:load', function() {

    $('#dropdown-menu').on('click', function() {
      $('.application-nav').slideToggle();
      $('.blog-nav').slideToggle();
    });

  });
});
