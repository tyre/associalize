class AddLocationToDeal < ActiveRecord::Migration
  def change
    add_column :locations, :deal_id, :integer
  end
end