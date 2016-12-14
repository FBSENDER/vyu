class AppController < ApplicationController
  layout "app_layout"
  def tag
    @tag = Tag.where(name: params[:name]).take
    not_found if @tag.nil?
    @contents = Content.where(status:1, id: @tag.relation_id.split(',')).select(:id,:title,:tags,:img_url,:description,:type_id).paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "content_list", locals: {articles: @articles}
      return 
    end
    render "content_list"
  end
  def content
    @content = Content.where(id: params[:id].to_i).take
    not_found if @content.nil?
    @contents = JSON.parse(@content.content_json)
    @path = request.fullpath
    @next = Content.where("id > ? and type_id = ? and status = 1", @content.id, @content.type_id).order("id").take
    @pre = Content.where("id < ? and type_id = ? and status = 1", @content.id, @content.type_id).order("id desc").take
    if @content.type_id
      @article = @content
      render "article"
    end
  end
  def article_list
    @contents = Content.where(type_id: 0, status: 1).select(:id,:title,:tags,:img_url,:description,:type_id).order("id desc").paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "content_list", locals: {contents: @contents}
      return 
    end
    render "content_list"
  end
  def article_news
    @articles = Article.where(category_id: 2, status: 1).select(:id,:title,:tags,:img_url,:description).order("id desc").paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "article_list", locals: {articles: @articles}
      return 
    end
    render "article_list"
  end
  def article_wenda
    @articles = Article.where(category_id: 3, status: 1).select(:id,:title,:tags,:img_url,:description).order("id desc").paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "article_list", locals: {articles: @articles}
      return 
    end
    render "article_list"
  end
  def card_ssr
    @cards = Card.where(level: 'ssr').select(:id,:img_url,:name)
    render "card_list"
  end
  def card_sr
    @cards = Card.where(level: 'sr').select(:id,:img_url,:name)
    render "card_list"
  end
  def card_r
    @cards = Card.where(level: 'r').select(:id,:img_url,:name)
    render "card_list"
  end
  def card
    @card = Card.where(id: params[:id].to_i).take
    not_found if @card.nil?
    @juexing = JSON.parse(@card.juexing_json)
    @skill = JSON.parse(@card.skill_json)
    @team = JSON.parse(@card.team_json)
    @suit = JSON.parse(@card.suit_json)
    @path = request.fullpath
    @next = Card.where("id > ?", @card.id).order("id").take
    @pre = Card.where("id < ?", @card.id).order("id desc").take
  end
  def hot
    @path = request.fullpath
    @tags = ArticleTag.pluck(:name).sample(25)
  end
  def jubao
  end

  def sale_list(sort_type)
    data = get_sale_json(sort_type, params[:page] || 0, params[:keyword] || '')
    @items = data["data"]["list"]
    @title ="值得买"
    @path = request.fullpath
    if request.xhr?
      render partial: "sale_list", locals: {items: @items}
      return 
    end
    render "/app/sale_list"
  end

  def sale_new
    sale_list(1)
  end
  def sale_xiaoliang
    sale_list(6)
  end
  def sale_youhui
    sale_list(5)
  end
  def sale_jiage
    sale_list(4)
  end
  def sale_search
    sale_list(1)
  end

  def get_sale_json(sort_type = 1, page = 0, keyword = '')
    url = "http://m.bantangapp.com/activity/event/list?sort_type=#{sort_type}&page=#{page}&pagesize=20&&app_id=5&v=1&keyword=#{keyword}"
    data =JSON.parse(Net::HTTP.get(URI(URI.encode(url))))
    data
  end

  def download
    redirect_to "http://www.yysssr.com"
  end
end
