class PointsController < ApplicationController

  def index
    @points = Point.all
    # render layout: 'map_view'
  end

end
