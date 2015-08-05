class HomeController < ApplicationController
  # before_filter :authenticate_user!
  def index
    # @papers=Article.where("blogtype=?","js").order(created_at: :DESC).limit(3)
    @papers=Article.order(created_at: :DESC).limit(10)
    @papers2=Article.order(created_at: :DESC).limit(10)
  end
end
