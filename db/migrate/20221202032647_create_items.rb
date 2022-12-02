class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :trip_id
      t.integer :category
      t.belongs_to :trip, foreign_key: true
      t.timestamps
    end
  end
end
