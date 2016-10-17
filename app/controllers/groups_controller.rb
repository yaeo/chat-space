class GroupsController < ApplicationController
  def index
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "yay! 新しいグループを作成しました :)"
      redirect_to root_url
    else
      flash[:errors] = current_user.errors.full_messages
      redirect_to new_group_url
    end
  end

  def edit

  end

  def update

  end

  private

    def group_params
       params.require(:group).permit(:name, :user_ids => [])
      #  binding.pry
    end
end
