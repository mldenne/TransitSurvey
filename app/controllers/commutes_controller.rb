class CommutesController < ApplicationController

  def index
    directions = GoogleDirections.new(origin, destination)
    @commute = directions
  end

  def new
    @commute = Commute.new
  end

  def create

  end

  private

  def commute_params
    params.permit(:origin, :destination)
  end

end
