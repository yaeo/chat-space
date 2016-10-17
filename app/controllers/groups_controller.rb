class GroupsController < ApplicationController
  def index
    @message = Message.new
  end

  def new
    # users = User.all
    @group = Group.new
    @group.members.build
    @group.users.build
  end

  def create
    @group = Group.create(group_params)
    # @group = Group.new(name: params[:group][:name], members_attributes: [ {user_id: params[:group][:user_ids][1]},{user_id: params[:group][:user_ids][2]} ])
    # if @group.save
      # member = Member.new(group_id: @group.id, user_id: params[:group][:user_ids][0])
      # member.save
    redirect_to root_url
    # else
    #   #失敗したとき
    # end
  end

  def edit

  end

  def update

  end

  private

    def group_params
       params.require(:group).permit(:name, members_attributes:[:user_id])
    end
end
