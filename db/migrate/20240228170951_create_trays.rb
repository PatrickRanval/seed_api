class CreateTrays < ActiveRecord::Migration[7.1]
  def change
    create_table :trays do |t|
      t.string :name
      t.integer :cells_short
      t.integer :cells_long

      t.timestamps
    end
  end
end
