# onmount
$(document).on 'turbolinks:load', ->
  $.onmount()

$(document).on 'turbolinks:before-cache', ->
  $.onmount.teardown()
