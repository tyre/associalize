# require 'spec_helper'

# describe DealWorker do
#   it 'populates the database with deals' do
#     previous_count = Deal.count
#     VCR.use_cassette 'deals' do
#       DealWorker.perform
#     end
#     Deal.count.should > (previous_count)
#   end
# end