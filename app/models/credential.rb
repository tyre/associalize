class Credential < ActiveRecord::Base
  belongs_to :authentication
  has_one :user, :through => :authentication
  validates :token, presence: true
  validates :secret, presence: true  
  attr_accessible :token, :secret
end
