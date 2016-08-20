class CommutesController < ApplicationController

  def index
    if params[:commute_id] != nil
      @commute = Commute.find(params[:commute_id])
    else
      render :new
    end
  end

  def new
    @commute = Commute.new
  end

  def create
    @commute = Commute.new(commute_params)
    if @commute.valid?
      directions = GoogleDirections.new(@commute.origin, @commute.destination)
      @commute.distance_in_miles = directions.distance_in_miles
      @commute.drive_time_in_minutes = directions.drive_time_in_minutes
    end
    if @commute.save
      directions.polylines_as_points.each do |x|
        @commute.points << Point.new(lat: x.first, lng: x.last)
      end
      redirect_to commutes_path(commute_id: @commute.id)
    else
      render :new
    end
  end

  private

  def commute_params
    params.require(:commute).permit(:origin, :destination)
  end

end
