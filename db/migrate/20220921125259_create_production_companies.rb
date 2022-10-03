class CreateProductionCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :production_companies do |t|
      t.integer :turnover 
      t.string :name 
      t.integer :movies_count
      t.timestamps
    end
  end
end
