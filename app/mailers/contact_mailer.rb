class ContactMailer < ApplicationMailer
  def contact_admin(user, text)
    @from = user.email
    @text = text
    @to = Admin.first.email
    mail to: @to if @to
  end
end
