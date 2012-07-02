class AddLinkToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :link, :string
  end
end
