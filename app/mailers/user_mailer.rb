class UserMailer < ApplicationMailer

  def password_reset
    @user = params[:user]
    mail(to: @user.email, subject: "Password reset")

  end
end
