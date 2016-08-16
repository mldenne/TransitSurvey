class CommutesController < ApplicationController

  def index
    directions = GoogleDirections.new(origin, destination)

  end

end
