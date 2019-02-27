class AddUuiToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :selection_uui, :string
  end
end
