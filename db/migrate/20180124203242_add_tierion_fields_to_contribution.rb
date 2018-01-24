class AddTierionFieldsToContribution < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :tierion_hash, :string
    add_column :contributions, :tierion_receipt_id, :string
  end
end
