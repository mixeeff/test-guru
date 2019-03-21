 class FeedbacksMailer < ApplicationMailer
  default to: "dm.mikheev@gmail.com"

  def mail_admin(feedback)
    @feedback = feedback
    mail subject: "Test-Guru feedback"
  end
end
