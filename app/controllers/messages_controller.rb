class MessagesController < ApplicationController
  def create
    Message.create(create_message_params)
    redirect_to root_path
  end

  private
    def create_message_params
      params.require(:message).permit(:body)
    end
end
