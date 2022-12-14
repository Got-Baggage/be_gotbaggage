class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :traveler
      t.integer :category
      t.string :image
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.timestamps
    end
  end
end
