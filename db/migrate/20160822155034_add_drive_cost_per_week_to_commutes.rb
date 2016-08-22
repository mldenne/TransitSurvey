class AddDriveCostPerWeekToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :drive_cost_per_week, :integer
  end
end
