class CreateDailies < ActiveRecord::Migration[7.0]
  def change
    create_table :dailies do |t|
      t.belongs_to :user
      t.datetime :date 
      t.integer :expenses
      t.string :details
      t.timestamps  
    end
  end
end
