class Community < ApplicationRecord

  extend FriendlyId
  friendly_id :city, use: :slugged

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

  def total_commuter_drive_cost_per_week
    commuters_within_range.sum(:drive_cost_per_week)
  end

  def total_commuter_drive_cost_per_year
    commuters_within_range.sum(:drive_cost_per_year)
  end

  def self.csv_headers
    ["city", "commuters_within_range_count", "average_commuter_miles", "total_commuter_drive_cost_per_week", "total_commuter_drive_cost_per_year"]
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << csv_headers
      all.each do |community|
        csv << csv_headers.collect{ |method| community.send(method) }
      end
    end
  end

end
