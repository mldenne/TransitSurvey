class AddLatToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :lat, :float
  end
end
