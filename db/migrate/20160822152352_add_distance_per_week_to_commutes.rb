class AddDistancePerWeekToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :distance_per_week, :integer
  end
end
