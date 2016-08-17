class Point < ApplicationRecord
  belongs_to :commute

directions.polylines_as_points.length
commute.points << Point.new(lat: thing.first, lng: thing.last)

end
