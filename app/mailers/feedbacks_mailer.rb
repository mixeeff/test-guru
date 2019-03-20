 class FeedbacksMailer < ApplicationMailer
  default to: "dm.mikheev@gmail.com"

  def mail_admin(email, body)
    @from = email
    @body = body
    mail subject: "Test-Guru feedback"
  end
end
