class CommunitiesController < ApplicationController

  def index
    @communities = Community.all.order(city: :asc)
    respond_to do |format|
      format.html
      format.csv { send_data @communities.to_csv }
    end
  end

  def show
    @community = Community.friendly.find(params[:id])
    commute_ids = @community.commuters_within_range.ids
    @points = Point.where(commute_id: commute_ids)
  end

end
