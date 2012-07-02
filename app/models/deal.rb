class Deal < ActiveRecord::Base
  has_one :location
  validates_uniqueness_of :_id

  def self.create_from_mongo_deal(deal)
    new_deal = Deal.new
    deal.attributes.each do |key, value|
      if key == 'market_location'
        new_deal.build_location({latitude: value[0],longitude: value[1]})
      elsif new_deal.respond_to?("#{key}=")
        new_deal.send("#{key}=", value.to_s)
      end
    end
    new_deal.save
  end

  def self.local_deals(boundary)
    joins(:location) \
    .where(
      locations: {
        longitude: boundary.longitude_range,
        latitude: boundary.latitude_range
        },
        sold_out: false) \
    .group('long_title')
  end


  def self.national_deals
    where({
      national: 'true',
      sold_out: 'false'
    })
  end
end