class Commute < ApplicationRecord

  has_many :points, dependent: :destroy
  validates :origin_cannot_be_outside_indianapolis, :destination_cannot_be_outside_indianapolis, presence: true

  def origin_cannot_be_outside_indianapolis
    indy_location = Geokit::Geocoders::GoogleGeocoder.geocode('Indianapolis, IN')
    origin_location = Geokit::Geocoders::GoogleGeocoder.geocode(self.origin)
    if indy_location.distance_to(origin_location) > 100
      errors.add(:origin, "Origin cannot be more than 100 miles outside of Indianapolis")
    end
  end

  def destination_cannot_be_outside_indianapolis
    indy_location = Geokit::Geocoders::GoogleGeocoder.geocode('Indianapolis, IN')
    destination_location = Geokit::Geocoders::GoogleGeocoder.geocode(self.destination)
    if indy_location.distance_to(destination_location) > 100
      errors.add(:destination, "Destination cannot be more than 100 miles outside of Indianapolis")
    end
  end

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

  def drive_days_per_year
    ((drive_hours_per_week * 50) / 24.0).round(2)
  end

  def drive_cost_per_week
    (distance_per_week * 0.54).round(0)
  end

  def drive_cost_per_year
    (drive_cost_per_week * 50).round(0)
  end

end
