class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message =  Message.new(message_params)
    @message.user = @current_user
    @message.save
    redirect_to message_url(@message.id)
  end

  def show
    @message = Message.find(params[:id])
  end
  def message_params
    params.require(:message).permit(:title, :content)
  end
end
