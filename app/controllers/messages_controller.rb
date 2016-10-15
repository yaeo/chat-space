class MessagesController < ApplicationController
  def create
    @message = Message.new(create_message_params)
    if @message.save
      #メッセージの保存に成功したときの処理
      redirect_to root_url
    else
      #メッセージの保存に失敗したときの処理
      flash[:errors] = @message.errors.full_messages
      redirect_to root_url
    end
  end

  private
    def create_message_params
      params.require(:message).permit(:body)
    end
end
