require 'link'
require 'jd'

class GuizeController < ApplicationController
  def yumaoqiu
    redirect_pc_to_mobile
    @robot = is_robot?
    #@articles = Article.where(status: 1).select(:id,:title).sample(10)
    #if @robot
    #  file = Rails.root.join("public").join("home.html")
    #  if File.exists?(file) && !params[:is_refresh]
    #    render inline: File.read(file), layout: nil
    #    return
    #  end
    #end
    @links = Link.where(status: 1).to_a
    #ids = [21..35].to_a + [36..277].sample(25)
    #@related = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url)
    #@related = YProduct.where(id: ids).select(:id, :dtitle, :actualPrice, :mainPic)
    @related = []
  end
  def login
    data = {:is_login => 1, :user => {:img_url => "http://photo.pic.sohu.com/images/oldblog/person/11111.gif", :nickname => "羽毛球爱好者", :user_id => "1", :profile_url => "http://www.vxixi.com", :sign => "TR2dgMfO71XkmW34lkMTdIMylQY="}}
    render :json => data.to_json, :callback => params[:callback]
  end
  def logout
  end
end
