# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120628190312) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
  end

  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"

  create_table "credentials", :force => true do |t|
    t.integer  "authentication_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "credentials", ["authentication_id"], :name => "index_credentials_on_authentication_id"

  create_table "deals", :force => true do |t|
    t.string   "_id"
    t.string   "original_id"
    t.string   "published"
    t.string   "updated"
    t.string   "title"
    t.string   "long_title"
    t.string   "deal_type"
    t.string   "market_id"
    t.string   "market_name"
    t.string   "country_code"
    t.string   "subtitle"
    t.string   "offer_ends_at"
    t.string   "price"
    t.string   "value"
    t.string   "savings"
    t.string   "orders_count"
    t.string   "categories"
    t.string   "image_url"
    t.string   "sold_out"
    t.string   "national"
    t.string   "merchandise_type"
    t.string   "description"
    t.string   "details"
    t.string   "content"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "market_location"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "link"
  end

  create_table "facebook_users", :force => true do |t|
    t.string   "facebook_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "feed_items", :force => true do |t|
    t.string   "post_id"
    t.text     "message"
    t.string   "post_type"
    t.integer  "comment_count"
    t.datetime "created_time"
    t.datetime "updated_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "from_facebook_user_id"
    t.integer  "to_facebook_user_id"
    t.integer  "user_id"
  end

  add_index "feed_items", ["from_facebook_user_id"], :name => "index_feed_items_on_from_facebook_user_id"
  add_index "feed_items", ["to_facebook_user_id"], :name => "index_feed_items_on_to_facebook_user_id"
  add_index "feed_items", ["user_id"], :name => "index_feed_items_on_user_id"

  create_table "locations", :force => true do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "deal_id"
  end

  add_index "locations", ["deal_id"], :name => "index_locations_on_deal_id"
  add_index "locations", ["user_id"], :name => "index_locations_on_user_id"

  create_table "tweets", :force => true do |t|
    t.text     "content"
    t.text     "source_id"
    t.integer  "user_id"
    t.string   "handle"
    t.datetime "post_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",            :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
