class GroupsController < ApplicationController
  def index
    @message = Message.new
    @groups = Member.where(user_id: current_user.id)
  end

  def show
    @message = Message.new
    @groups = Member.where(user_id: current_user.id)
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
      flash[:errors] = @group.errors.full_messages
      redirect_to new_group_url
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:success] = "yay! グループ情報を更新しました :)"
      redirect_to root_url
    else
      flash[:errors] = @group.errors.full_messages
      redirect_to edit_group_url(@group)
    end
  end

  private

    def group_params
       params.require(:group).permit(:name, :user_ids => [])
      #  binding.pry
    end
end
