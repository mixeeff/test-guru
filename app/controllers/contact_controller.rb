class ContactController < ActionController::Base
  def edit; end

  def send_mail
    ContactMailer.contact_admin(current_user, params[:body]).deliver_now
    redirect_to root_path
  end
end
