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
    @next = Content.where("id > ? and type_id = ? and status = 1", @content.id, @content.type_id).select(:id,:title).order("id").take
    @pre = Content.where("id < ? and type_id = ? and status = 1", @content.id, @content.type_id).select(:id,:title).order("id desc").take
    if @content.type_id == 0
      @article = @content
      render "article"
    elsif @content.type_id == 1
      @video = @content
      render "video"
    else
      raise "unknown content type_id"
    end
  end
  def article_list
    content_list(0)
  end
  def video_list
    content_list(1)
  end
  def content_list(type_id = 0)
    @contents = Content.where(type_id: type_id, status: 1).select(:id,:title,:tags,:img_url,:description,:type_id).order("id desc").paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "content_list", locals: {contents: @contents}
      return 
    end
    render "content_list"
  end
  def hot
    @path = request.fullpath
    @tags = ArticleTag.pluck(:name).sample(25)
  end
  def jubao
  end

  def tbk_list(fav_id)
    data = get_tbk_uatm_json(fav_id, (params[:page] || 0).to_i)
    @items = data["tbk_uatm_favorites_item_get_response"]["results"]["uatm_tbk_item"]
    @title ="值得买"
    @path = request.fullpath
    if request.xhr?
      render partial: "tbk_list", locals: {items: @items}
      return 
    end
    render "/app/tbk_list"
  end

  def sale_pai
    tbk_list(2322121)
  end
  def sale_xie
    tbk_list(2322124)
  end
  def sale_qiu
    tbk_list(2322133)
  end
  def sale_haocai
    tbk_list(2322128)
  end
  def sale_search
    data = get_tbk_search_json(params[:keyword].strip, (params[:page] || 0).to_i)
    @items = data["tbk_item_get_response"]["results"]["n_tbk_item"]
    @keyword = params[:keyword].strip
    @title ="值得买"
    @path = request.fullpath
    if request.xhr?
      render partial: "search_tbk_list", locals: {items: @items}
      return 
    end
    render "/app/search_tbk_list"
  end

  def get_tbk_uatm_json(fav_id = 1,page_no)
    tbk = Tbkapi::Taobaoke.new
    JSON.parse(tbk.taobao_tbk_uatm_favorites_item_get(fav_id,68494758,'ymqapp','23487656','bd2e9dc09968be2b011cdf3ad13360cd',2,page_no + 1,20))
  end

  def get_tbk_search_json(keyword, page_no)
    tbk = Tbkapi::Taobaoke.new
    JSON.parse(tbk.taobao_tbk_item_get(keyword, '23487656','bd2e9dc09968be2b011cdf3ad13360cd',page_no + 1,20))
  end
end
