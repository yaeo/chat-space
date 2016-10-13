class MessagesController < ApplicationController
  def create
    @message = Message.create(create_message_params)
    flash[:error] = @message.errors.full_messages
    redirect_to root_path
  end

  private
    def create_message_params
      params.require(:message).permit(:body)
    end
end
