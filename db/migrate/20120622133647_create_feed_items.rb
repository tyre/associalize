class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table  :feed_items do |t|
      t.string   :post_id
      t.integer   :facebook_user_id
      t.text      :message
      t.string    :post_type
      t.integer   :comment_count
      t.datetime  :created_time
      t.datetime  :updated_time

      t.timestamps
    end
  end
end
