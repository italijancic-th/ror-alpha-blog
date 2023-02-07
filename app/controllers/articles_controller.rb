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

  # CREATE of CRUD operations involves two acctions on RoR:
  # - new   --> To render new element form
  # - crate --> To create new instance of model and save on data base
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

  # UPDATE of CRUD operations, involve two acctions on RoR
  # - edit    --> To show form to edit article data
  # - update  --> To update DB entry with new data send from form render on edit action
  def edit
    # Find the article by id
    @article = Article.find(params[:id])
  end

  def update
    # Find the article by id
    @article = Article.find(params[:id])
    # Update article en DB
    if @article.update(params.required(:article).permit(:title, :description))
      flash[:notice] = 'Article successfully updated'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE operations of CRUD
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # Redirect to articles index
    redirect_to articles_path
  end
end
