class CreateCheckpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :checkpoints do |t|
      t.float :latitude
      t.float :longitude
      t.string :location
      t.references :race

      t.timestamps
    end
  end
end
