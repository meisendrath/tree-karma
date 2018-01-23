class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :address

      t.timestamps
    end
  end
end
