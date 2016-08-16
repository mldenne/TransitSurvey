class Commute < ApplicationRecord

  def distance_per_day
    distance_in_miles * 2
  end

  def distance_per_week
    distance_per_day * 5
  end

  def drive_minutes_per_week
    drive_time_in_minutes * 10
  end

  def drive_hours_per_week
    (drive_minutes_per_week / 60.0).round(2)
  end

  def drive_cost_per_week
    (distance_per_week * 0.54).round(0)
  end

end
