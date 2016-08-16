class CreateCommutes < ActiveRecord::Migration[5.0]
  def change
    create_table :commutes do |t|
      t.string :origin
      t.string :destination
      t.integer :distance_in_miles
      t.integer :drive_time_in_minutes

      t.timestamps
    end
  end
end
