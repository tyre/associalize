class DealWorker
  @queue = 'deal'

  def self.perform
    LivingSocialDeal.all.each do |new_deal|
      unless Deal.where(_id: new_deal._id.to_s).any?
        Deal.create_from_mongo_deal(new_deal)
      end
    end
  end
end