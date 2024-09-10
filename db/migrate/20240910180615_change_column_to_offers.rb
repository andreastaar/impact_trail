class ChangeColumnToOffers < ActiveRecord::Migration[7.1]
  def change
    rename_column :offers, :logitude, :longitude
  end
end
