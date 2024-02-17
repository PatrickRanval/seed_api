class CreateSourceRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :source_records do |t|
      t.references :source, null: false, foreign_key: true
      t.references :variety, null: false, foreign_key: true
      t.text :story

      t.timestamps
    end
  end
end
