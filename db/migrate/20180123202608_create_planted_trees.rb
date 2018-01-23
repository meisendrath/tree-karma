class CreatePlantedTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :planted_trees do |t|
      t.string :name
      t.attachment :image
      t.references :location, foreign_key: true
      t.date :planted_date
      t.numeric :planted_age_years

      t.timestamps
    end
  end
end
