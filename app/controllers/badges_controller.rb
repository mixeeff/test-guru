class BadgesController < ApplicationController
  # GET /badges
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  def show
    @badge = Badge.find(params[:id])
  end
end
