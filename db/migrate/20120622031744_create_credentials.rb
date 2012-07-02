class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :authentication_id
      t.string :token
      t.string :secret
      t.timestamps
    end
  end
end
