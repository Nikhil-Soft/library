class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :daily
      t.references :send_to, foreign_key: { to_table: 'users' }
      t.references :send_by, foreign_key: { to_table: 'users' }
      t.string :name
      t.timestamps
    end
  end
end
