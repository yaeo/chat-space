class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    current_group = Group.find(@message.group_id)
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_url(current_group)}
        format.json { render json:
          {
          name: @message.user.name,
          date: @message.created_at.strftime('%Y年%m月%d日 %H:%M'),
          body: @message.body,
          image: @message.image.url
          }
        }
      else
        flash[:errors] = @message.errors.messages
        format.html { redirect_to group_url(current_group) }
        format.json { redirect_to group_url(current_group) }
      end
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :group_id, :image).merge(user_id: current_user.id)
    end
end
