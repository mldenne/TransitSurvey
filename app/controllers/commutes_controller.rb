class CommutesController < ApplicationController

  def index
    directions = GoogleDirections.new(origin, destination)
    @commute = directions
  end

end
