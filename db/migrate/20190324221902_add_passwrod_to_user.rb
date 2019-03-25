class AddPasswrodToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_password, :integer
  end
end
