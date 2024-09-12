class AddDatesfieldstoApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :start_date, :date
    add_column :applications, :end_date, :date
  end
end
