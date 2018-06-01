$( document ).ready(function( $ ) {
  $(document).on('turbolinks:load', function() {

    $('#application-nav__button').on('change', function() {
      $('.application-nav').slideToggle();
    });

  });
});
