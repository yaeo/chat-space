class UsersController < ApplicationController
  def edit
    @user = User.find(current_user)
  end
end
