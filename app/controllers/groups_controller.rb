class GroupsController < ApplicationController
  def index
    @message = Message.new
  end
end
