class DealExpirer
  def self.perform
    Deal.all.each do |deal|
      expire_time = DateTime.parse(deal.offer_ends_at)
      deal.destroy if expire_time < DateTime.now
    end
  end
end