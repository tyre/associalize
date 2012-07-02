require 'spec_helper'

describe Location do
  context 'invalid initialization' do

    it 'rejects non-number values for latitude' do
      Location.create(latitude: 'HAROLD').should raise_error
    end

    it 'rejects non-number values for longitude' do
      Location.create(longitude: 'HAROLD').should raise_error
    end

    it 'rejects non-earthly values for latitude' do
      Location.create(latitude: -91).should raise_error
    end
        it 'rejects non-earthly values for longitude' do
      Location.create(longitude: 190).should raise_error
    end

  end

  it 'outputs a valid JSON representation' do
    json_string = Location.create(latitude: 15, longitude: -15).to_json
    parsed = JSON.parse(json_string)
    parsed.should be_kind_of(Hash)
  end

end
