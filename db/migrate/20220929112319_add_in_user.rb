class AddInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :mobile_no, :integer
    add_column :users, :full_name, :string
  end
end
