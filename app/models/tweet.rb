class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :source_id, :handle, :post_time
  after_create :parse_message

  def html_safe_content
    self.content.html_safe
  end

  def parse_message
    self.content = self.content.split(' ').inject([]) do |new_message, word|
      new_word = word
      if word.match(/@/)
        word =~ /@(\w+)/
        new_word = "<a target='_blank' class='mention' href='#{url_for_user($1)}'>#{word}</a>"
      elsif word.include?('http') 
        new_word ="<a href='#{word}'>#{word}</a>"
      end
      new_message << new_word
    end.join(' ')
    save
  end

  def url_for_user(username)
    "https://twitter.com/#!/#{username}"
  end
end
