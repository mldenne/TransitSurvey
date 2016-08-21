class CreateTextfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :textfiles do |t|
      t.string :filename
      t.string :content

      t.timestamps
    end
  end
end
