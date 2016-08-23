class CommunitiesController < ApplicationController

  def index
    @community.Community.all
  end

  def show
    @community.Community.find(params[:id])
  end

end
