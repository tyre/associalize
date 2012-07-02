require "spec_helper"

describe Personalizer do
  use_vcr_cassette
  let!(:user) { Fabricate(:user) }
  let!(:location) { Fabricate(:location) }
  context 'initialization' do
    it 'takes in a user and sets a boundary' do
      user.current_location = location
      p = Personalizer.new(user)
      p.boundary.should be 
      p.boundary.should be_a(Boundary)
    end
  end
end