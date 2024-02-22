class CreateJoinTableVendorsSources < ActiveRecord::Migration[7.1]
  def change
    create_join_table :vendors, :sources do |t|
      # t.index [:vendor_id, :source_id]
      # t.index [:source_id, :vendor_id]
    end
  end
end
