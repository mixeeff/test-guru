class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  layout 'admin'

  def admin_required!
    redirect_to root_path, alert: 'Эта страница доступна только администратору' unless current_user.is_a?(Admin)
  end
end
