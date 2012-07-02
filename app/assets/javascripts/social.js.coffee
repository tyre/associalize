class StreamRenderer
  constructor: (@type, @postsName) ->
    @template = $("##{@postsName}-template")[0]
    @stream = $("##{@type}-stream ul")[0]

  render: =>
    $.get("/#{@postsName.replace('-', '_')}", @renderPosts)

  renderPosts: (posts) =>
    for post in posts
      $(@stream).append Mustache.to_html($(@template).html(), post)


addTwitterLinks = ->
  console.log $('.handle')
  for handle in $('.handle')
    name = $(handle).text()
    $(handle).wrap("<a href='http://twitter.com/#!/#{name}' target='_blank'></a>")

$ ->
  renderers = {twitter: new StreamRenderer('twitter', 'tweets'),facebook: new StreamRenderer('facebook', 'feed-items')}
  renderers.twitter.render()
  renderers.facebook.render()
  t = setTimeout(addTwitterLinks, 200)