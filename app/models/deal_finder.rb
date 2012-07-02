class DealFinder
  attr_accessor :all_deals

  def initialize(boundary = nil)
    self.boundary = boundary
  end

  def get_deals
    self.all_deals = \
      if boundary
        scope.local_deals(boundary)
      else
        scope.national_deals
      end
  end

  private
  attr_accessor :boundary

  def scope
    Deal.limit(10)
  end
end