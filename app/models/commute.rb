class Commute < ApplicationRecord

  def drive_time_per_week
    drive_time_in_minutes * 10
  end
end
