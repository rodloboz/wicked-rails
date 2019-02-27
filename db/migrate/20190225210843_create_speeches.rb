class CreateSpeeches < ActiveRecord::Migration[5.2]
  def change
    create_table :speeches do |t|
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
