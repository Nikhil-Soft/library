class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :name 
      t.integer :type
      t.references :imageable , polymorphic: true
    end
  end
end
