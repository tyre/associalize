class TweetsController < ApplicationController
  def index
    @tweets = current_user.tweets.order('post_time DESC')
  end
end
