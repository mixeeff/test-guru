class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.welcome', user_name: current_user.full_name)
  end
end
