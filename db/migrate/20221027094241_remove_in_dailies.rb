class RemoveInDailies < ActiveRecord::Migration[7.0]
  def change
    remove_column :dailies, :salary, :integer
  end
end
