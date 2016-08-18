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
    if @commute.save
      directions.polylines_as_points.each do |x|
        @commute.points << Point.new(lat: x.first, lng: x.last)
      end
      redirect_to root_path(commute_id: @commute.id)
    else
      @commute = Commute.new
    end
  end

  private

  def commute_params
    params.require(:commute).permit(:origin, :destination)
  end

end
