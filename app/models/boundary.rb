class Boundary
  DISTANCE = 50 #miles
  BOUNDARY_URL = 'http://deep-stone-8106.herokuapp.com/'
  attr_accessor :center_point, :connection, :max_coords, :min_coords
  def initialize(center_point)
    self.center_point = center_point
    self.connection = Faraday.new(url: BOUNDARY_URL)
    find_corners
  end

  def find_corners
    center = self.center_point
    response = self.connection.get do |req|
      req.url '/boundary'
      req.params[:latitude] = center.latitude
      req.params[:longitude] = center.longitude
      req.params[:distance] = Boundary::DISTANCE
    end
    parse_boundary_response(response)
  end

  def parse_boundary_response(resp)
    coords = JSON.parse(resp.body)
    self.max_coords = Location.new coords['maximum']
    self.min_coords = Location.new coords['minimum']
  end

  def latitude_range
    self.min_coords.latitude...self.max_coords.latitude
  end

  def longitude_range
    self.min_coords.longitude...self.max_coords.longitude
  end
end