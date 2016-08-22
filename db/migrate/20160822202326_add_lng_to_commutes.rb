class AddLngToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :lng, :float
  end
end
