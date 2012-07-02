class AddIndices < ActiveRecord::Migration
  def change
    add_index :feed_items, :user_id
    add_index :feed_items, :from_facebook_user_id 
    add_index :feed_items, :to_facebook_user_id
    add_index :credentials, :authentication_id
    add_index :authentications, :user_id
  end
end
