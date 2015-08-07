class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token ,
  def index
@messages=Message.all



  end

  def create


    @message=Message.new message_params
    @message.save
    redirect_to(:action => 'index')

  end


  def message_params
    params.require(:message).permit( :text,)
  end
end
