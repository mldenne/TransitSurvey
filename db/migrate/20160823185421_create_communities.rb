class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string :city
      t.float :lat
      t.float :lng
      t.integer :range

      t.timestamps
    end
  end
end
