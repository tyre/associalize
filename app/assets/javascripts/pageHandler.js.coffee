class PageHandler
  constructor: ->
    @pages = $('section')
    @currentPageNum = 0
    @currentPage = @pages.first() 
    $(document).keydown @navigate

  navigate: (event) =>
    switch event.keyCode
      when 37                         # left arrow
        @pageLeft()
        false

      when 38                         # up arrow
        @pageUp()
        false

      when 39                         # right arrow
        @pageRight()
        false

      when 40                         # down arrow
        @pageDown()
        false

  pageLeft: ->

  pageRight: ->

  pageUp: ->
    unless @currentPageNum == 0
      @currentPageNum--
      @moveToSection()

  pageDown: ->
    unless @currentPageNum == (@pages.length - 1)
      @currentPageNum++
      @moveToSection()
      
  moveToSection: ->
    @currentPage = @pages[@currentPageNum]
    console.log @currentPage
    $('html, body').animate({ scrollTop: $(@currentPage).offset().top }, 500)

$ ->
  window.PageHandler = new PageHandler