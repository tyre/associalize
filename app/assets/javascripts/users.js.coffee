setBodyHeight = ->
  bodyHeight = $(window).height() - 75
  $('.stream-body').height(bodyHeight)
  $(window).resize ->
    newHeight = $(window).height() - 75
    $(this).height(newHeight)

$ ->
  setBodyHeight()