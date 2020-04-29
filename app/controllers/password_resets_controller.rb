class PasswordResetsController < ApplicationController
  skip_before_action :authorize

  def create
    user = User.find_by(email: params[:email])
    if user

      now = Time.zone.now
      new_password = Digest::MD5.hexdigest(now.to_s)

      # user.password = new_password
      # user.password_confirmation = new_password
      user.password_reset_token = unique_token
      user.password_reset_set_at = now

      UserMailer.with(user: user).password_reset.deliver_later if user.save
      # UserMailer.send_password_reset(user).deliver_now if user.save


      # email the user
      # provide a link to a unique page
      # set a new password
    end
    message = "If you have an account, you will receive instructions in your email to reset your password. If you do not receive an email, please contact someone."
    redirect_to login_path, notice: message
  end

  def edit
    @user = User.find_by password_reset_token: params[:password_reset_token] 
    @user.email = ""
    redirect_to login_path, notice: "That link has expired.".html_safe unless @user
  end

  def update
    @user = User.find_by password_reset_token: params[:password_reset_token], email: user_params[:email]
    redirect_to edit_password_reset_path, notice: "There was a problem. contact someone immediately.".html_safe and return unless @user

    if @user.update(user_params)
      redirect_to login_path, notice: 'your password has been updated'
    else
      render :edit, notice: 'nope'
    end
  end

  private

  def unique_token
    begin
      return_value = SecureRandom.base58(24)
    end while User.exists?(password_reset_token: return_value)
    return_value
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
