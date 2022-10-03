class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name 
      t.integer :movies_count
      t.integer :age 
      t.integer :experiences 
      t.timestamps
    end
  end
end
