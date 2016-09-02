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
      points = directions.polylines_as_points.collect { |x| Point.new(commute: @commute, lat: x.first, lng: x.last) }
      Point.import points
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
