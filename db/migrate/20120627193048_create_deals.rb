class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :_id
      t.string :original_id
      t.string :published
      t.string :updated
      t.string :title
      t.string :long_title
      t.string :deal_type
      t.string :market_id
      t.string :market_name
      t.string :country_code
      t.string :subtitle
      t.string :offer_ends_at
      t.string :price
      t.string :value
      t.string :savings
      t.string :orders_count
      t.string :categories
      t.string :image_url
      t.string :sold_out
      t.string :national
      t.string :merchandise_type
      t.string :description
      t.string :details
      t.string :content
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :market_location

      t.timestamps
    end
  end
end