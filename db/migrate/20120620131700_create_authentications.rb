class CreateAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :name, :string
    add_column :authentications, :email, :string
    add_column :authentications, :nickname, :string
    add_column :authentications, :image, :string      
  end
end
