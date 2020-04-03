class PasswordResetsController < ApplicationController
  skip_before_action :authorize

  def create
    user = User.find_by(email: params[:email])
    if user
      # email the user
      # provide a link to a unique page
      # set a new password
    end
    message = "If you have an account, you will receive instructions to reset your password. If you do not receive an email, please contact someone."
    redirect_to login_path, notice: message
  end

  def update

  end

end
