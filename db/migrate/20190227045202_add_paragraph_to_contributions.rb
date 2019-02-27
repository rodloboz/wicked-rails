class AddParagraphToContributions < ActiveRecord::Migration[5.2]
  def change
    add_column :contributions, :paragraph, :integer
  end
end
