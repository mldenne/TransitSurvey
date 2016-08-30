class CommutesController < ApplicationController

  def index
    @commutes = Commute.all
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
      respond_to do |format|
        format.html { redirect_to commute_path(@commute.id) }
        format.js
      end
    else
      @commute_errors = @commute
      render :new
    end
  end

  def show
    @commute = Commute.find(params[:id])
    @points = Point.all
  end

  private

  def commute_params
    params.require(:commute).permit(:origin, :destination)
  end

end
