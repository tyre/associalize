class Personalizer
  attr_accessor :user, :all_deals, :boundary

  def initialize(user)
    self.user = user
    self.boundary = self.user.boundary
  end

  def get_deals
    if self.user.current_location?
      with_location
    else
      without_location
    end
  end

  def with_location
    self.all_deals =  Deal.joins(:location).where(
      locations: {
        longitude: self.boundary.longitude_range,
        latitude: self.boundary.latitude_range
        },
        sold_out: false).group('long_title').limit(10)
  end

  def without_location
    self.all_deals = Deal.scoped.where({
      national: 'true',
      sold_out: 'false'}).limit(10)
  end
end