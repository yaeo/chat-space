class GroupsController < ApplicationController
  def index
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
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
       params.require(:group).permit(:name, :user_ids => [])
      #  binding.pry
    end
end
