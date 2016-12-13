class AppController < ApplicationController
  layout "app_layout"
  def video
    @path = "/app/video/"
  end
end
