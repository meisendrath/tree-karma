class CreatePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :company_name
      t.string :stripe_id
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
