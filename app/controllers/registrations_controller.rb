class RegistrationsController < ApplicationController
  skip_before_action :authorize, only: [:index, :new, :create]

  def index
    redirect_to new_registration_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
