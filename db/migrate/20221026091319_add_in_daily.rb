class AddInDaily < ActiveRecord::Migration[7.0]
  def change
    add_column :dailies, :salary, :integer
  end
end
