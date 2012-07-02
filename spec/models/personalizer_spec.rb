require "spec_helper"

describe DealFinder do

  context 'with location' do
    it 'returns deals within that boundary' do
      boundary = double('Boundary')
      deal_finder = DealFinder.new(boundary)
      Deal.should_receive(:local_deals).with(boundary).and_return(:foo)
      deal_finder.get_deals
      deal_finder.all_deals.should == :foo
    end
  end

  context 'without a location' do
    it 'returns national deals' do
      deal_finder = DealFinder.new()
      Deal.should_receive(:national_deals).and_return(:bar)
      deal_finder.get_deals
      deal_finder.all_deals.should == :bar
    end
  end
end