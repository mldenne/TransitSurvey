class Community < ApplicationRecord

  acts_as_mappable :auto_geocode=>{:field=>:city, :error_message=>'Could not geocode address'}

  def commuters_within_range
    Commute.within(range, :origin => [lat, lng])
  end

  def commuters_within_range_count
    commuters_within_range.count
  end

  def average_commuter_miles
    commuters_within_range.average(:distance_in_miles)
  end

end
