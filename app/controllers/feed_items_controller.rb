class FeedItemsController < ApplicationController
  def index
    @feed_items = current_user.feed_items.order('created_time DESC')
  end
end
