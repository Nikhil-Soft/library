class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.string :name
      t.integer :status
      t.integer :amount
      t.string :details
      t.timestamps
    end
  end
end
