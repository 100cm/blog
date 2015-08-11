class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index,:search]
  skip_before_filter :verify_authenticity_token, :only => [ :create_image,:search]
  def index
    @articles = Article.order(:id).page params[:page]


  end
  def new


    redirect_to :root unless current_user && current_user.admin?

  end

  def show

    @article=Article.find_by_id params[:id]
    if @article
      @next_article =  Article.where("created_at > :start_date",
                   {start_date: @article.created_at}).limit(1)


      @last_article =  Article.where("created_at < :start_date",
                                     {start_date: @article.created_at}).last(1)
      @article.viewtimes=@article.viewtimes+1;
      @article.save
      @all_comments = @article.root_comments
      @random=rand(1..61)
else
  redirect_to(:action => 'index')
end
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

  def search
    @search = true

    @articles = Article.find_by_sql( " select * from articles where title like '%"+params[:articles][:title]+"%'")
    @contents = @articles

  end

  private
  def article_params
    params.require(:article).permit(:title, :text,:author,:blogtype)
  end
end

