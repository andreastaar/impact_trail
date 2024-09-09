class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :requirements
      t.date :start_date
      t.date :end_date
      t.integer :availability
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :logitude

      t.timestamps
    end
  end
end
