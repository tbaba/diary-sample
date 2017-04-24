# frozen_string_literal: true
class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).all
  end

  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_attributes

    if @article.save
      redirect_to @article, notice: '記事を作成しました'
    else
      render 'new'
    end
  end

  private

  def article_attributes
    params.require(:article).permit(:title, :body)
  end
end
