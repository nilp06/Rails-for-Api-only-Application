class Api::V1::CommentsController < ApplicationController
  before_action :set_article, only: %i[create index page]
  before_action :set_comment, only: %i[update destroy show]

  def index
    render json: @article.comments.all
  end

  def page
    @comments = Article.get_comment_page(params[:article_id], params[:page_number].to_i)
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @article.comments << @comment
    if @article.save
      render json: @comment
    else
      render json: { error: 'article is not updated.' }, status: 400
    end
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { error: 'comment not updated.' }, status: 400
    end
  end

  def destroy
    if @comment.destroy
      render json: { message: 'comment deleted successfully.' }
    else
      render json: { error: 'comment not deleted.' }, status: 400
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
