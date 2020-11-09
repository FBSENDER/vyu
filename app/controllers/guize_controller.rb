require 'link'

class GuizeController < ApplicationController
  def yumaoqiu
    #redirect_pc_to_mobile
    @robot = is_robot?
    #@articles = Article.where(status: 1).select(:id,:title).sample(10)
    @links = Link.where(status: 1).to_a
  end
  def login
    data = {:is_login => 1, :user => {:img_url => "http://photo.pic.sohu.com/images/oldblog/person/11111.gif", :nickname => "羽毛球爱好者", :user_id => "1", :profile_url => "http://www.vxixi.com", :sign => "TR2dgMfO71XkmW34lkMTdIMylQY="}}
    render :json => data.to_json, :callback => params[:callback]
  end
  def logout
  end
end
