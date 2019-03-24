class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.decimal :value
      t.decimal :price
      t.integer :guests
      t.integer :user_id

      t.timestamps
    end
  end
end
