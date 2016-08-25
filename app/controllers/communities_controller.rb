class CommunitiesController < ApplicationController

  def index
    @communities = Community.all.sort
  end

  def show
    @community = Community.friendly_id.find(params[:id])
    commute_ids = @community.commuters_within_range.ids
    @points = Point.where(commute_id: commute_ids)
  end

end
