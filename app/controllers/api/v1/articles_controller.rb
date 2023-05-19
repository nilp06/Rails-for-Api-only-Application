class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.includes(:comments).all
    render json: @articles, includes: :comments
  end

  def page
    @articles = Article.get_article_page(params[:page_number].to_i)
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      render json: @article
    else
      render json: { error: @article.errors }, status: 400
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: { error: 'Failed to update article.' }, status: 400
    end
  end

  def destroy
    if @article.destroy
      render json: { message: 'Article successfully deleted.' }, status: 200
    else
      render json: { error: 'Failed to update article.' }, status: 400
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
