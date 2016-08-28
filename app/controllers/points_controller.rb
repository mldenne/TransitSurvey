class PointsController < ApplicationController

  def index
    @points = Point.all
  end

  def show
    @point = Point.find(@communte.points)
  end

end
