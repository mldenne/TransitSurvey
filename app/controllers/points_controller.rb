class PointsController < ApplicationController
  render layout: 'map_view'

  def index
    @points = Point.all
  end

end
