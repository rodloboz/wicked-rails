class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.references :speech, foreign_key: true
      t.string :start_position
      t.string :end_position
      t.string :content

      t.timestamps
    end
  end
end
