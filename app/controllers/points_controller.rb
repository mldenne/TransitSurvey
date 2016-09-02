class PointsController < ApplicationController

  def index
    @points = Point.all
    @commutes = Commute.all
  end

  def show
    @point = Point.find(@communte.points)
  end

end
