class AddFieldsToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :city, :string
    add_column :offers, :country_name, :string
    add_column :offers, :perks, :string
  end
end
