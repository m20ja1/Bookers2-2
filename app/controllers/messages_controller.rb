class MessagesController < ApplicationController

  def create
    @message = Current.user.messages.new(message_params)
    if @message.save
      redirect_to room_path(@message.room_id)
    else
      redirect_back fallback_location: root_path
    end
  end

 private

  def message_params
    params.require(:message).permit(:content, :room_id)
  end

end
