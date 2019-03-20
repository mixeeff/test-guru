class FeedbacksController < ApplicationController
  
  def new; end

  def create
    if params[:email].empty?
      flash[:error] = t('.email_not_presend')
      render :new
      return
    end
    if params[:body].empty?
      flash[:error] = t('.body_not_presend')
      render :new
      return
    end
    FeedbacksMailer.mail_admin(params[:email], params[:body]).deliver_now
    redirect_to root_path, flash: { success: t('.sent') }
  end
end
