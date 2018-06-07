ready = ->
  Typed.new '.home__typed-title',
    strings: [
      'Welcome to the Devcamp Portfolio'
    ]
    typeSpeed: 50
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
