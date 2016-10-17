class GuizeController < ApplicationController
  def yumaoqiu
    redirect_pc_to_mobile
    @articles = Article.where(status: 1).select(:id,:title).sample(10)
  end
end
