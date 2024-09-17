class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :organization_address, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
