class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update_with_password(user_params)
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end
