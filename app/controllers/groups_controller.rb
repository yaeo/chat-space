class GroupsController < ApplicationController
  def index
    @groups = Member.where(user_id: current_user.id)
    group_id = Group.where(name: params[:group_name])
    @messages = Message.where(group_id: group_id)
    respond_to do |format|
      format.html {  }
      format.json { render json: @messages.to_json(include: {:user => {only: :name}}) }
    end
  end

  def show
    @message = Message.new
    @group = Group.find(params[:id])
    @paticipate_groups = Member.where(user_id: current_user.id)
    @messages = Message.where(group_id: params[:id])
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
    @members = @group.users
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
    end
end
