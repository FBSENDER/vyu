class AppController < ApplicationController
  layout "app_layout"
  def tag
    @tag = Tag.where(name: params[:name]).take
    not_found if @tag.nil?
    @type_ids = [0,1,2]
    if params[:type_id]
      @type_ids = [params[:type_id].to_i]
    end
    @contents = Content.where(id: @tag.relation_id.split(','), status: 1, type_id: @type_ids).select(:id,:title,:tags,:img_url,:description,:type_id).paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "content_list", locals: {contents: @contents}
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
    elsif @content.type_id == 2
      @video = @content
      render "video"
    else
      raise "unknown content type_id"
    end
  end

  def collection_list
    @collections = params[:type] ? Collection.where(type_id: params[:type].to_i).to_a : Collection.all.to_a
    @title = case params[:type]
             when "1" then '技术分类'
             when "2" then '教程合辑'
             when "3" then '比赛合辑' 
             else '视频合辑'
             end
  end

  def collection
    @collection = Collection.where(id: params[:id].to_i).take
    not_found if @collection.nil?
    @contents = Content.where(status: 1).joins("join bd_collection_content_relations on bd_collection_content_relations.content_id = bd_contents.id and bd_collection_content_relations.collection_id = #{@collection.id}").select(:id,:tags,:title,:img_url,:type_id).paginate(page: params[:page])
    @title = @collection.name
    render "content_list"
  end

  def article_list
    content_list(0)
  end
  def video_list
    content_list(1)
  end
  def game_new
    content_list(2)
  end
  def game_jingdian
    @tag = Tag.where(id: 14).take
    @contents = Content.where(status:1, id: @tag.relation_id.split(',')).select(:id,:title,:tags,:img_url,:description,:type_id).paginate(page: params[:page])
    @path = request.fullpath
    @is_ipad = is_ipad?
    if request.xhr?
      render partial: "content_list", locals: {articles: @articles}
      return 
    end
    render "content_list"
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
    @tags = Tag.pluck(:name).sample(25)
  end
  def jubao
  end

  def tbk_list(fav_id)
    data = get_tbk_uatm_json(fav_id, (params[:page] || 0).to_i)
    p data
    @items = data["tbk_uatm_favorites_item_get_response"]["results"]["uatm_tbk_item"]
    @title ="特惠-羽毛球装备"
    @path = request.fullpath
    if request.xhr?
      render partial: "tbk_list", locals: {items: @items}
      return 
    end
    render "/app/tbk_list"
  end

  def sale_pai
    tbk_list(2295076)
  end
  def sale_xie
    tbk_list(2295109)
  end
  def sale_qiu
    tbk_list(2295129)
  end
  def sale_haocai
    tbk_list(2295134)
  end
  def sale_search
    data = get_tbk_search_json(params[:keyword].strip, (params[:page] || 0).to_i)
    @items = data["tbk_item_get_response"]["results"]["n_tbk_item"]
    @keyword = params[:keyword].strip
    @title ="搜索-羽毛球装备"
    @path = request.fullpath
    if request.xhr?
      render partial: "search_tbk_list", locals: {items: @items}
      return 
    end
    render "/app/search_tbk_list"
  end

  def get_tbk_uatm_json(fav_id = 1,page_no)
    tbk = Tbkapi::Taobaoke.new
    JSON.parse(tbk.taobao_tbk_uatm_favorites_item_get(fav_id,75364574,'tbkvxixi','23184262','022a6647badb948d3cf8d6b8022476ce',2,page_no + 1,20))
  end

  def get_tbk_search_json(keyword, page_no)
    tbk = Tbkapi::Taobaoke.new
    JSON.parse(tbk.taobao_tbk_item_get(keyword, '23184103','1d49e7bae53ea281d9a4333d5dabd1ca',page_no + 1,20))
  end

  def search
    k = params[:keyword].strip
    return unless check_keyword(k)
    @keyword = Keyword.where(keyword: k).take
    if @keyword
      if @keyword.tag_name.empty?
        render :json => {code: 0}.to_json
      else
        render :json => {code: 1,tag: URI.encode(@keyword.tag_name)}.to_json
      end
      @keyword.counter += 1
      @keyword.save
      return
    end
    tag = check_already_tags(k)
    if tag
      render :json => {code: 1,tag: URI.encode(tag)}.to_json
      keyword = Keyword.new
      keyword.keyword = k
      keyword.tag_name = tag
      keyword.save
      return
    end
    contents = Content.where("status = 1 and title like ?", "%#{k}%").select(:id,:tags)
    if contents && contents.size > 0
      t = Tag.new
      t.name = k
      t.relation_id = contents.map{|a| a.id}.join(',')
      t.save
      render :json => {code: 1,tag: URI.encode(k)}.to_json
      keyword = Keyword.new
      keyword.keyword = k
      keyword.tag_name = k
      keyword.save
      contents.each do |content|
        ts = content.tags.split(',')
        ts << k
        content.tags = ts.uniq.join(',')
        content.save
      end
      return
    end
    render :json => {code: 0}.to_json
  end

  def check_keyword(keyword)
    if keyword.empty? || keyword.size > 16
      redirect_to "/app/search/"
      return false
    end
    return true
  end

  def check_already_tags(keyword)
    tags = Tag.pluck(:name)
    tags.each do |tag|
      if tag.include?(keyword) || keyword.include?(tag)
        return tag
      end
    end
    return nil
  end

end
