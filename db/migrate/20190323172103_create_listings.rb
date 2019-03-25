class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :seller_id
      t.integer :buyer_id
      t.references :holiday, foreign_key: true

      t.timestamps
    end
  end
end
