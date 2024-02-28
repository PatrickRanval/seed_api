class CreateUserTrays < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trays do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tray, null: false, foreign_key: true
      t.text :seed_map

      t.timestamps
    end
  end
end
