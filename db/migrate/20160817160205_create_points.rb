class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.float :lat
      t.float :lng
      t.references :commute, foreign_key: true

      t.timestamps
    end
  end
end
