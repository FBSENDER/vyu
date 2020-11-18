require 'jd'
class JdController < ApplicationController
  def static_product
    @product = YmqProduct.where(id: params[:id].to_i).take
    not_found if @product.nil?
    @info = JSON.parse(@product.info)
    @title = @product.title.split.join
    @related = JSON.parse(@product.related)
  end
end
