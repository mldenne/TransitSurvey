class Community < ApplicationRecord

  acts_as_mappable :auto_geocode=>{:field=>:city, :error_message=>'Could not geocode address'}

  def commuters_within_range
    Commute.within(self.range, :origin => [self.lat, self.lng])
  end

end
