$( document ).ready(function( $ ) {
  $(document).on('turbolinks:load', function() {

    $('#dropdown-menu').on('click', function() {
      $('.application-nav').slideToggle();
      $('.header__nav').slideToggle();
      $('.portfolio-nav__list').slideToggle();
    });

  });
});
