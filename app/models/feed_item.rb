class FeedItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_facebook_user, :class_name => :FacebookUser
  belongs_to :to_facebook_user, :class_name => :FacebookUser  
  attr_accessible :post_id, :from_facebook_user_id, :from_facebook_user_id, :message, :post_type,
  :created_time, :updated_time, :user_id
  after_create :parse_message

  def add_attributes_from_hash(hash)
    add_attributes(hash)
    save
    add_facebook_users(hash)
  end

  def add_attributes(hash)
    hash.each do |key, value|
      if self.respond_to?("#{key}=")
        if key.match /time/
          send("#{key}=", Time.new(value))
        else
          send("#{key}=", value)
        end
      elsif self.respond_to?("post_#{key}=")
        send("post_#{key}=", value) 
      end
    end
  end

  def add_facebook_users(hash)
    create_facebook_user_from_hash(hash['from'], :from)
    create_facebook_user_from_hash(hash['to']['data'].first, :to) if hash['to']
  end

  def create_facebook_user_from_hash(hash, type)
    facebook_user = FacebookUser.find_or_create_by_facebook_id(hash['id'])
    facebook_user.name = hash['name']
    facebook_user.save
    save_user_by_type(facebook_user, type)
  end

  def save_user_by_type(facebook_user, type)
    self.send("#{type}_facebook_user_id=", facebook_user.id)
    save
  end

  def from_user_name
    from_facebook_user ? from_facebook_user.name : ""
  end

  def html_safe_message
    self.message.html_safe
  end

  def parse_message
    if self.message
      new_message = self.message
      new_message.split(' ').each do |word|
        new_word = word
        if word.include?('http') 
          new_word ="<a href='#{word}'>#{word}</a>"
        end
        new_message += new_word
      end.join(' ')
      self.message = new_message
      save
    end
  end
end