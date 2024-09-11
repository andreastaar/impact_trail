class RemoveOfferidFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :offer_id, :integer
    add_column :reviews, :organization_id, :integer
  end
end
