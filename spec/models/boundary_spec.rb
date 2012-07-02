require 'spec_helper'


describe Boundary do
  use_vcr_cassette
  let!(:location){ Fabricate(:location)}
  let!(:boundary){Boundary.new(location)}

  it 'has maximum coordinates as location' do
    boundary.max_coords.should be_kind_of(Location)
  end

  it 'has minimum coordinates as location' do
    boundary.min_coords.should be_kind_of(Location)
  end
end