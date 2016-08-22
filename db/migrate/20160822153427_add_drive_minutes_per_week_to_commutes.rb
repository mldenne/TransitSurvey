class AddDriveMinutesPerWeekToCommutes < ActiveRecord::Migration[5.0]
  def change
    add_column :commutes, :drive_minutes_per_week, :integer
  end
end
