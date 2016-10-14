class UsersController < ApplicationController
  def edit
    @user = User.find(current_user)
  end

  def update
    current_user.update_with_password(update_user_params)
    redirect_to root_path
  end

  private
    def update_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end
