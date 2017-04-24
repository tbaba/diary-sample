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

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update article_attributes
      redirect_to @article, notice: '記事を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to articles_path, notice: '記事を削除しました'
  end

  private

  def article_attributes
    params.require(:article).permit(:title, :body)
  end
end
