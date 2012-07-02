class FacebookUser < ActiveRecord::Base
  has_many :feed_items
  attr_accessible :facebook_id, :name
end
