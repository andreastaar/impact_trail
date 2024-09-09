class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_column :users, :location, :string
    add_column :users, :instagram_account, :string
    add_column :users, :facebook_account, :string
    add_column :users, :organization_name, :string
    add_column :users, :description, :text
  end
end
