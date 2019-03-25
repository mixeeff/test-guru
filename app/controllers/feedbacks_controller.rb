class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
    @feedback.email = view_context.current_user_email
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.mail_admin(@feedback).deliver_now
      redirect_to root_path, flash: { success: t('.sent') }
    else
      render :new
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end
