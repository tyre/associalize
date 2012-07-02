
## commented out because finding address is creepy. May be useful though...
# class Address
#   constructor: (addressObject) ->
#     for obj in addressObject['address_components']
#       @parseAddressComponent(obj)

#   parseAddressComponent: (obj) =>
#     addressComponentType = obj['types'][0]
#     this[addressComponentType] = obj['short_name']


# geocode = (lat, long) ->
#   latLong = new google.maps.LatLng(lat, long)
#   geocoder = new google.maps.Geocoder()
#   geocoder.geocode {'latLng': latLong}, geocodeResults

# geocodeResults = (results, status) ->
#   address = new Address(results[0])

getDeals = ->
  $.get('/current_user/deals', renderDeals)

renderDeals = (results) ->
  console.log results
  for deal in results
    $('#deals').append Mustache.to_html($('#deal-template').html(), deal)

updateLocation = (lat, long) ->
  location = {latitude: lat, longitude: long }
  $.post('/current_user/update_location', location: location, geocode_error: false, getDeals)

$ ->
  navigator.geolocation.getCurrentPosition( (geoposition)->
    lat = geoposition.coords.latitude
    long = geoposition.coords.longitude
    updateLocation(lat, long)
    # geocode(lat, long)
  (error) ->
    $.post('/current_user/update_location', geocode_error: true, getDeals))


