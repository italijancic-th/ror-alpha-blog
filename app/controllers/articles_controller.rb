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

  # Create a new article
  def new
  end

  def create
    @article = Article.new(params.required(:article).permit(:title, :description))
    if @article.save
      redirect_to @article
    else
      redirect_to new_article_path
    end
    # binding.break
  end
end
