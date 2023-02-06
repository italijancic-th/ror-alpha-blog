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
    # In order to get access to errors on save operations and redirect to this form again
    @article = Article.new
  end

  def create
    @article = Article.new(params.required(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      # Helpers usage to redirect to nother page
      redirect_to @article
    else
      # Two ways to re render new article form, in case of error saving
      # redirect_to new_article_path
      render :new, status: :unprocessable_entity
      # NOTE: this is the way to do this of error handle on RoR 7
      # new = name of template .erb to render
    end
    # binding.break
  end
end
