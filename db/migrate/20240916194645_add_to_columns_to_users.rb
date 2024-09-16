class AddToColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :city_name, :string
    add_column :users, :full_location, :string
  end
end
