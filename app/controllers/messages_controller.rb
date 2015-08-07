class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token ,
  def index
@messages=Message.all.order(created_at: :DESC)



  end
  def create_image

    post_image = PostImage.create(image: params[:upload],
                                  user_id: current_user.id)
    post_image.save

    render text: "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]}, '#{post_image.image.url}', '');</script>"

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
