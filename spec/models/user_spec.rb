require "spec_helper"

describe User do
  use_vcr_cassette
  let(:user) {Fabricate(:user)}
  let!(:location) {Fabricate(:location)}

  context 'location' do
    it 'creates a location when its current_location is updated' do
      user.current_location = location
      user.locations.any? do |l|
        l.latitude == location.latitude && l.longitude == location.longitude
      end.should be_true
    end

    it 'has a current location' do
      user.current_location = location
      user.current_location?.should be_true
    end
  end
end