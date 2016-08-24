class CommunitiesController < ApplicationController

  def index
    @community = Community.all
  end

  def show
    @community = Community.find(params[:id])
    commute_ids = @community.commuters_within_range.ids
    @points = Point.where(commute_id: commute_ids)
  end

end
