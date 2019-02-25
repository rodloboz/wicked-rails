class AddActiveToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :active, :boolean, default: false
  end
end
