class ProfilesController < ApplicationController

  def show
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "updated!"
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
