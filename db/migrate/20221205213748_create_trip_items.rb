class CreateTripItems < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_items do |t|
      t.references :trip
      t.references :item
      
      t.timestamps
    end
  end
end
