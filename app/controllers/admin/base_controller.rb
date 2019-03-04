class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  layout 'admin'

  def admin_required!
    redirect_to root_path, alert: t('.admin_required') unless current_user.admin?
  end
end
