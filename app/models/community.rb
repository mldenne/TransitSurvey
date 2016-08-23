class Community < ApplicationRecord

  acts_as_mappable :auto_geocode=>{:field=>:city, :error_message=>'Could not geocode address'}

end
