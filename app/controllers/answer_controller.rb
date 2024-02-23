require 'jd'
class AnswerController < ApplicationController
  def index
    @articles = Answer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
  end

  def show
    @answer = Answer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  Answer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
  end

  def en_index
    @articles = EnAnswer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
    render layout: "application_en"
  end
  def en_show
    @answer = EnAnswer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  EnAnswer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
    render layout: "application_en"
  end

  def tw_index
    @articles = TwAnswer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
    render layout: "application_tw"
  end
  def tw_show
    @answer = TwAnswer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  TwAnswer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
    render layout: "application_tw"
  end

  def ja_index
    @articles = JaAnswer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
    render layout: "application_ja"
  end
  def ja_show
    @answer = JaAnswer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  JaAnswer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
    render layout: "application_ja"
  end

  def id_index
    @articles = IdAnswer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
    render layout: "application_id"
  end
  def id_show
    @answer = IdAnswer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  IdAnswer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
    render layout: "application_id"
  end

  def es_index
    @articles = EsAnswer.where(status: 1).select(:id,:title).to_a
    @is_robot = is_robot?
    render layout: "application_es"
  end
  def es_show
    @answer = EsAnswer.where(id: params[:id].to_i, status: 1).take
    not_found if @answer.nil?
    @path = "#{request.path}/"
    @is_robot = is_robot?
    s =  EsAnswer.where(status: 1).select(:id,:title).to_a
    @articles = s.sample(10)
    @next = s.select{|item| item.id > @answer.id}.sort{|a,b| a.id <=> b.id}.first
    @pre = s.select{|item| item.id < @answer.id}.sort{|a,b| b.id <=> a.id}.first
    ids = (1..277).to_a.sample(16)
    @products = YmqProduct.where(id: ids).select(:id, :title, :price_info, :pic_url).take(8)
    render layout: "application_es"
  end
end
