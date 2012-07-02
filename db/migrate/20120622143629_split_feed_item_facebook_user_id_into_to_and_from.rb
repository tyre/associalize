class SplitFeedItemFacebookUserIdIntoToAndFrom < ActiveRecord::Migration
  def change
    add_column :feed_items, :from_facebook_user_id, :integer
    add_column :feed_items, :to_facebook_user_id, :integer
    remove_column :feed_items, :facebook_user_id
  end
end
