class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update_with_password(user_params)
      flash[:success] = "ユーザー情報を編集しました :)"
      redirect_to root_url
    else
      redirect_to edit_user_url(current_user)
      flash[:errors] = current_user.errors.full_messages
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end
