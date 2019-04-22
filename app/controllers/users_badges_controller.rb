class UsersBadgesController < ApplicationController
  # GET /badges
  def index
    @badges = current_user.badges
  end
end
