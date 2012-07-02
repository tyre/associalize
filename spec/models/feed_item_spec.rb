require 'spec_helper'

describe FeedItem do
  it 'adds a link to a message' do
    fi = FeedItem.new(message: 'hello http://www.google.com world')
    fi.parse_message
    fi.message.should match(/<a href='http:\/\/www\.google\.com'>/)
  end
end
