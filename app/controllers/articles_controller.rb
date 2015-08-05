class ArticlesController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:destroy ,:create_image]
  def index
    @articles = Article.order(:id).page params[:page]


  end
  def new


    redirect_to :root unless current_user && current_user.admin?

  end

  def show

      @article=Article.find_by_id params[:id]
      @all_comments = @article.root_comments


  end

  def create

    @article = Article.new article_params
    @article.author=current_user.username
    @article.save
    redirect_to(:action => 'index')





  end
  def edit
    @article = Article.find(params[:id])



  end
  def create_image

    post_image = PostImage.create(image: params[:upload],
                                  user_id: current_user.id)
    post_image.save

    render text: "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]}, '#{post_image.image.url}', '');</script>"

  end
  def update
    @article= Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title, :text,:author,:blogtype)
  end
end

