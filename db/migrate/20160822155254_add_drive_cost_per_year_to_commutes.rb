class AddDriveCostPerYearToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :drive_cost_per_year, :integer
  end
end
