class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.integer :status, null: false, default: 0, index: true
      t.references :contributor, foreign_key: true
      t.references :partner, foreign_key: true
      t.references :item, polymorphic: true
      t.string :stripe_id
      t.monetize :price
      t.datetime :completed_at

      t.timestamps
    end
  end
end
