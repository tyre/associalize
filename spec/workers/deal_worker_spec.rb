require 'spec_helper'

describe DealWorker, slow: true do
  it 'populates the database with deals' do
    expect {
      DealWorker.perform
    }.to change { Deal.count }
  end
end