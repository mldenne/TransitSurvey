class Commute < ApplicationRecord

  # Cost calculations are hard-coded into the method, see method below. To find the most recent IRS Standard Mileage Rate for Business, go to https://www.irs.gov/uac/newsroom/2016-standard-mileage-rates-for-business-medical-and-moving-announcedIRS.
  # Transit comparative cost is hard-coded into the method, see method below. To calculate new data, go to https://www.transit.dot.gov/ntd and download the latest NTD Data/NTD Data Reports

  has_many    :points, dependent: :destroy

  validates   :origin, presence: true
  validates   :destination, presence: true
  validate    :origin_cannot_be_outside_indianapolis,
              :destination_cannot_be_outside_indianapolis, on: :create

  before_save :save_distance_per_day,
              :save_distance_per_week,
              :save_drive_minutes_per_week,
              :save_drive_hours_per_week,
              :save_drive_days_per_year,
              :save_drive_cost_per_week,
              :save_drive_cost_per_year

  acts_as_mappable :auto_geocode=>{:field=>:origin, :error_message=>'Could not geocode address'}

  def origin_cannot_be_outside_indianapolis
    indy_location = Geokit::Geocoders::GoogleGeocoder.geocode('Indianapolis, IN')
    origin_location = Geokit::Geocoders::GoogleGeocoder.geocode(self.origin)
    if indy_location.distance_to(origin_location) > 65
      errors.add(:origin, "Origin cannot be more than 65 miles outside of Indianapolis")
    end
  end

  def destination_cannot_be_outside_indianapolis
    indy_location = Geokit::Geocoders::GoogleGeocoder.geocode('Indianapolis, IN')
    destination_location = Geokit::Geocoders::GoogleGeocoder.geocode(self.destination)
    if indy_location.distance_to(destination_location) > 65
      errors.add(:destination, "Destination cannot be more than 65 miles outside of Indianapolis")
    end
  end


  def save_distance_per_day
    self.distance_per_day = distance_in_miles * 2
  end

  def save_distance_per_week
    self.distance_per_week = distance_per_day * 5
  end

  def save_drive_minutes_per_week
    self.drive_minutes_per_week = drive_time_in_minutes * 10
  end

  def save_drive_hours_per_week
    self.drive_hours_per_week = (drive_minutes_per_week / 60.0).round(2)
  end

  def save_drive_days_per_year
    self.drive_days_per_year = ((drive_hours_per_week * 50) / 24.0).round(2)
  end

  def irs_standard_mileage_rate # hard-coded IRS Standard Mileage Rate for Business
    0.54
  end

  def save_drive_cost_per_week
    self.drive_cost_per_week = (distance_per_week * irs_standard_mileage_rate).round(0)
  end

  def save_drive_cost_per_year
    self.drive_cost_per_year = (drive_cost_per_week * 50).round(0)
  end

  def number_of_closest_commuters
    Commute.within(5, :origin => self.origin).count
  end

  def average_distance_traveled_of_closest_commuters
    Commute.within(5, :origin => self.origin).average(:distance_in_miles).to_s
  end

  def national_average_transit_cost # hard-coded NTD Transit Data for average US Transit Cost
    (2.342876994).round(2)
  end

  def transit_cost_per_week
    (national_average_transit_cost * 10).round(0)
  end

  def transit_cost_per_year
    (transit_cost_per_week * 50).round(0)
  end

  def savings_transit_cost_per_week
    self.drive_cost_per_week - transit_cost_per_week
  end

  def savings_transit_cost_per_year
    self.drive_cost_per_year - transit_cost_per_year
  end

end
