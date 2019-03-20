module FeedbacksHelper
  def current_user_email
    return current_user.email if current_user
  end
end
