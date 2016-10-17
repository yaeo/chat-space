class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      #メッセージの保存に成功したときの処理
      redirect_to root_path
    else
      #メッセージの保存に失敗したときの処理
      flash[:errors] = @message.errors.full_messages
      redirect_to root_path
    end
  end

  private
    def message_params
      #todo group_idを選択しているグループのものを入れるようにする
      params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: "1")
    end
end
