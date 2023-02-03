class ArticlesController < ApplicationController

  def show
    # @name = instance variable
    @article = Article.find(params[:id])
    # binding.break
  end

  def index
    @articles = Article.all
    # binding.break
  end

end
