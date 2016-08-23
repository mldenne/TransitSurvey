class CommunitiesController < ApplicationController

  def index
    @community.Community.all
  end

  def show
  end

end
