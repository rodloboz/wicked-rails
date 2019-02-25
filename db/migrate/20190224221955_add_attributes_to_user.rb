class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :about, :text
    add_column :users, :avatar, :string
    add_column :users, :video, :string
    add_column :users, :type, :string
  end
end
