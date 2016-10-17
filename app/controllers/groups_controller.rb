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
      member = Member.new(group_id: @group.id, user_id: params[:group][:user_ids][0])
      member.save
      redirect_to root_url
    else
      #失敗したとき
    end
  end

  def edit

  end

  def update

  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

    def member_params
      params.require(:group).permit(:user_ids)
    end

end
