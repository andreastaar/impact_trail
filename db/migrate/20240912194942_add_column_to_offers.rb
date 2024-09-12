class AddColumnToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :type_of_volunteering, :string
  end
end
