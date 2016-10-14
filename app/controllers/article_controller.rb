class ArticleController < ApplicationController
  def edit
  end
  def update
    @article = Article.where(id: params[:id].to_i).take
    not_found if @article.nil?
    @article_data = {title: @article.title, keywords: @article.keywords, description: @article.description, content_list: JSON.parse(@article.article_content)}.to_json
    @draft_data = {}.to_json
    render "update", layout: nil
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
  def publish
    @article = Article.where(id: params[:id].to_i).take
    if @article.nil?
      render :json => {code: 0, msg: "错误..."}
      return
    end
    if params[:anhao] == 'buyaole'
      @article.status = 9
      @article.save
      render :json => {code: 2}
      return
    end
    if params[:anhao] != 'mingyue3000li'
      render :json => {code: 0, msg: "少年，别闹~"}
      return
    end
    data = JSON.parse(params[:content])
    @article.title = params["title"] || ''
    @article.keywords = params["keywords"] || ''
    @article.description = params["description"] || ''
    @article.status = 1
    @article.img_url = data["content_list"].select{|item| item["type"] == 1}.first["image_url"]
    @article.article_content = data["content_list"].to_json
    @article.save
    render :json => {code: 1, id: @article.id}
  end
end
