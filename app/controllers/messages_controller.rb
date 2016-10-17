class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      #メッセージの保存に成功したときの処理
      redirect_to group_url(params[:message][:group_id])
    else
      #メッセージの保存に失敗したときの処理
      flash[:errors] = @message.errors.full_messages
      redirect_to root_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :group_id).merge(user_id: current_user.id)
    end
end
