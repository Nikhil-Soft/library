class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name 
      t.integer :price
      t.timestamps
    end
  end
end
