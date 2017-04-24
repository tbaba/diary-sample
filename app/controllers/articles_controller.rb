# frozen_string_literal: true
class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).all
  end
end
