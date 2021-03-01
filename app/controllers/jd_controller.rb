require 'jd'
class JdController < ApplicationController
  
  def dtk_product
    @product = YProduct.where(id: params[:id].to_i).take
    not_found if @product.nil?
    @related = YProduct.where("id > ?", @product.id).select(:id, :dtitle, :mainPic, :actualPrice).order(:id).limit(20)
    @products = show_product_list
  end

  def dtk_shop
    @shop = YShop.where(sellerId: params[:id].to_i).take
    not_found if @shop.nil?
    @related = YProduct.where("sellerId = ?", @shop.sellerId).select(:id, :dtitle, :mainPic, :actualPrice).order(:id).limit(20)
    @products = show_product_list
    @shops = YShop.where("id > ?", @shop.id).select(:sellerId, :shopName, :shopLogo).order(:id).limit(8)
  end

  def static_product
    @product = YmqProduct.where(id: params[:id].to_i).take
    not_found if @product.nil?
    @info = JSON.parse(@product.info)
    @title = @product.title.split.join
    @related = JSON.parse(@product.related)
    @products = show_product_list
  end

  def static_product_fenlei
    @fenlei = params[:fenlei].strip
    @items = YmqProduct.where(fenlei: @fenlei).select(:id, :title, :price_info, :pic_url)
    not_found if @items.size.zero?
    @products = show_product_list
  end

  def static_product_pinpai
    @pinpai = params[:pinpai].strip.upcase
    @items = YmqProduct.where(brand: @pinpai).select(:id, :title, :price_info, :pic_url)
    not_found if @items.size.zero?
    @products = show_product_list
  end

  private
  def show_product_list
    ids = [21..35].to_a + [36..277].sample(25)
    YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url)
  end
end
