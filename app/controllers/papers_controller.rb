class PapersController < ApplicationController

  def index

    @books = Article.order(:id).page params[:page]

  end

  def more

  end


end


