class CommentsController < ApplicationController
  before_filter :authenticate_user!
  # protect_from_forgery :except => :index
  #
  # # you can disable csrf protection on controller-by-controller basis:
  skip_before_filter :verify_authenticity_token ,
  def create
  @article = Article.find(params[:id])
  @user_who_commented = current_user
  @comment = Comment.build_from( @article, @user_who_commented.id, params[:comment][:body] )
  @comment.save
  redirect_to :controller => "articles" ,:action => "show",:id => params[:id]
  end

  def reply
if
    @article = Article.find(params[:id])
    @user_who_commented = current_user
    @comment = Comment.build_from( @article, @user_who_commented.id, params[:body] )
   @comment.save
    @comment.move_to_child_of(Comment.find(params[:comment_id]))






      render :json => {:status => :success }

    end

  end
  def destroy
    @comment=Comment.find(params[:comment_id])
    @comment.destroy
    render :json => {:status => :success}

  end


end
