$ ->
  $('#login-submit').click ->
    formData = $('#login-form').serialize()
    $.post('/signin',formData, 'json')