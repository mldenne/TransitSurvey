class AddDriveHoursPerWeekToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :drive_hours_per_week, :integer
  end
end
