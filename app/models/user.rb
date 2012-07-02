class User < ActiveRecord::Base
  include ProviderMethods
  authenticates_with_sorcery!
  has_many :authentications
  has_many :tweets
  has_many :feed_items
  has_many :locations
  attr_accessible :email, :password, :password_confirmation
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, length:
  { minimum: 7 }

  def current_location=(location)
    @current_location = self.locations.find_or_create_by_latitude_and_longitude(location.latitude, location.longitude)
    set_current_location_in_redis
    find_boundaries
    self.current_location
  end

  def find_boundaries
    @boundary = Boundary.new(current_location)
  end

  def nearby_deals
   DealFinder.new(boundary).get_deals
  end

  def current_location
    @current_location ||= self.get_location_in_redis
  end

  def boundary
    @boundary ||= find_boundaries  
  end

  def current_location?
    !self.current_location.blank?
  end

  def set_current_location_in_redis
    $redis.set("current_location_#{self.id}", self.current_location.to_json)
  end

  def clear_location
    @current_location = nil
    $redis.set("current_location_#{self.id}", nil)
  end

  def get_location_in_redis
    location_string = $redis.get("current_location_#{self.id}")
    location = location_string.blank? ? nil : Location.new(JSON.parse(location_string))
  end
end
