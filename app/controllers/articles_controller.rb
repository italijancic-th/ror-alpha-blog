# frozen_string_literal: true

# Article controller class
class ArticlesController < ApplicationController
  # This is a sort of middleware
  before_action :set_article, only: %i[show edit update destroy]

  def show
    # @name = instance variable
    # @article = Article.find(params[:id])
    # this is now exec by before action
    # binding.break
  end

  def index
    @articles = Article.all
    # binding.break
  end

  # CREATE of CRUD operations involves two actions on RoR:
  # - new   --> To render new element form
  # - crate --> To create new instance of model and save on data base
  def new
    # In order to get access to errors on save operations and redirect to this form again
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      # Helpers usage to redirect to another page
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

  # UPDATE of CRUD operations, involve two actions on RoR
  # - edit    --> To show form to edit article data
  # - update  --> To update DB entry with new data send from form render on edit action
  def edit
    # Find the article by id is done be before_action
  end

  def update
    # Find the article by id -> done on before_action helper
    # Update article en DB
    if @article.update(article_params)
      flash[:notice] = 'Article successfully updated'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE operations of CRUD
  def destroy
    @article.destroy
    # Redirect to articles index
    redirect_to articles_path
  end

  # ---------------
  # Private methods
  # ---------------
  private

  # Get article by id from DB
  def set_article
    @article = Article.find(params[:id])
  end

  # Parse data from request params
  def article_params
    params.required(:article).permit(:title, :description)
  end
end
