class ChangeContentTypeInContributions < ActiveRecord::Migration[5.2]
  def change
    change_column :contributions, :content, :text
  end
end
