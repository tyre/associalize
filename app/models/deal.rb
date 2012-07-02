class Deal < ActiveRecord::Base
  has_one :location

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
end