class AddUserToHoliday < ActiveRecord::Migration[5.2]
  def change
    add_reference :holidays, :user, foreign_key: true
  end
end
