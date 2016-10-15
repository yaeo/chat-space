class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update_with_password(user_params)
      redirect_to root_url
    else
      redirect_to edit_user_url(current_user)
      current_user.errors.full_messages.each do |message|
        flash[:error] = message
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end
