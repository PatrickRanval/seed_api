class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.references :variety, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.text :story
      t.boolean :organic_status

      t.timestamps
    end
  end
end
