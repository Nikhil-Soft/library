class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.belongs_to :author
      t.string :name
      t.string :decription
      t.float :price
      t.timestamps
    end
  end
end
