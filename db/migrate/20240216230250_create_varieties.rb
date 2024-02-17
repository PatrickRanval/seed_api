class CreateVarieties < ActiveRecord::Migration[7.1]
  def change
    create_table :varieties do |t|
      t.references :type, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
