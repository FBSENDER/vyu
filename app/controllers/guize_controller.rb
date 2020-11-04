require 'link'

class GuizeController < ApplicationController
  def yumaoqiu
    redirect_pc_to_mobile
    @robot = is_robot?
    #@articles = Article.where(status: 1).select(:id,:title).sample(10)
    @links = Link.where(status: 1).to_a
  end
end
