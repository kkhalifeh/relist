class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :startdate, :start_date
    rename_column :listings, :enddate, :end_date
  end
end
