class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  belongs_to :user
  belongs_to :deal
  validates :latitude, numericality: { greater_than_or_equl_to: -90, less_than_or_equl_to: 90 }
  validates :longitude, numericality: { greater_than_or_equl_to: -180, less_than_or_equl_to: 180 } 
   
  def to_json
    "{ \"latitude\": #{self.latitude},
      \"longitude\": #{self.longitude} }"
  end
end