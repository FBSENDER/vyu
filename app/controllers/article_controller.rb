class ArticleController < ApplicationController
  def edit
  end
  def update
  end
  def new
  end
  def show
    @article = Article.where(id: params[:id].to_i).select(:id,:article_content,:img_url,:title,:keywords,:description).take
    not_found if @article.nil?
    @path = "#{request.path}/"
    @contents = JSON.parse(@article.article_content)
    @articles = Article.select(:id,:title).sample(5)
  end
end
