class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:contents, :index]
  def index
    # @papers=Article.where("blogtype=?","js").order(created_at: :DESC).limit(3)

    @papers=Article.order(created_at: :DESC).limit(10)

    @papers2=Article.order(viewtimes: :DESC).limit(9)


  end

  def contents
    @papers2=Article.order(viewtimes: :DESC).limit(9)
   @article_type=params[:type]
    @articles = Article.where("blogtype=:content_type",{content_type:params[:type]}).page params[:page]



  end



end
