class DealWorker
  @queue = 'deal'

  def self.perform
    LivingSocialDeal.since_an_hour_ago.each do |new_deal|
      Deal.create_from_mongo_deal(new_deal)
    end
  end
end