class CreateSeedGrowingInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :seed_growing_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :variety, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :harvest_date
      t.text :story
      t.boolean :seeds_saved

      t.timestamps
    end
  end
end
