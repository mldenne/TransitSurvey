class PointsController < ApplicationController

  def index
    @points = Point.all
  end

end
