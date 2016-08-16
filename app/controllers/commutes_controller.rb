class CommutesController < ApplicationController

  def index

  end

  def new
    @commute = Commute.new
  end

  def create
    @commute = Commute.new(commute_params)
    Rails.logger.info @commute.inspect
    directions = GoogleDirections.new(@commute.origin, @commute.destination)
    @commute.distance_in_miles = directions.distance_in_miles
    @commute.drive_time_in_minutes = directions.drive_time_in_minutes
    Rails.logger.info directions.polylines
    Rails.logger.info directions.polylines_as_points
    @commute.save!
    Rails.logger.info @commute.persisted?
  end

  private

  def commute_params
    params.require(:commute).permit(:origin, :destination)
  end

end
