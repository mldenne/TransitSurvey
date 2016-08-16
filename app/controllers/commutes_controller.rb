class CommutesController < ApplicationController

  def index
    @commute = Commute.find(params[:commute_id])
  end

  def new
    @commute = Commute.new
  end

  def create
    @commute = Commute.new(commute_params)
    directions = GoogleDirections.new(@commute.origin, @commute.destination)
    @commute.distance_in_miles = directions.distance_in_miles
    @commute.drive_time_in_minutes = directions.drive_time_in_minutes
    # Rails.logger.info directions.polylines
    # Rails.logger.info directions.polylines_as_points
    @commute.save!
    redirect_to root_path(commute_id: @commute.id)
  end

  private

  def commute_params
    params.require(:commute).permit(:origin, :destination)
  end

end
