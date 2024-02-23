Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "shuiguo#jidanguo", constraints: {host: "www.jidanguo.top"}
  root "shuiguo#heigouqi", constraints: {host: "www.iheigouqi.top"}
  root "guize#yumaoqiu"
  get "changyan/login" => "guize#login"
  get "changyan/logout" => "guize#logout"
  get "/article/", to: "article#index"
  get "/article/:id", to: "article#show"
  get "/article/:id/update", to: "article#update"
  post "/article/publish", to: "article#publish"

  get "/answer/", to: "answer#index"
  get "/answer/:id", to: "answer#show"
  get "/en/answer/", to: "answer#en_index"
  get "/en/answer/:id", to: "answer#en_show"
  get "/tw/answer/", to: "answer#tw_index"
  get "/tw/answer/:id", to: "answer#tw_show"
  get "/ja/answer/", to: "answer#ja_index"
  get "/ja/answer/:id", to: "answer#ja_show"
  get "/id/answer/", to: "answer#id_index"
  get "/id/answer/:id", to: "answer#id_show"
  get "/es/answer/", to: "answer#es_index"
  get "/es/answer/:id", to: "answer#es_show"

  get "/yumaoqiu/:id.html", to: "jd#static_product"
  get "/yumaoqiu_fenlei/:fenlei", to: "jd#static_product_fenlei"
  get "/yumaoqiu_pinpai/:pinpai", to: "jd#static_product_pinpai"

  get "/yp/:id.html", to: "jd#dtk_product"
  get "/ys/:id.html", to: "jd#dtk_shop"

  get "/app/video", to: "app#video"
  get "/app/tag/:name", to: "app#tag"

  get "/app/article_list", to: "app#article_list"
  get "/app/video_list", to: "app#video_list"
  get "/app/game_new", to: "app#game_new"
  get "/app/game_jingdian", to: "app#game_jingdian"
  get "/app/content/:id", to: "app#content"
  get "/app/collection", to: "app#collection_list"
  get "/app/collection/:id", to: "app#collection"

  get "/app/sale_pai", to: "app#sale_pai"
  get "/app/sale_xie", to: "app#sale_xie"
  get "/app/sale_qiu", to: "app#sale_qiu"
  get "/app/sale_haocai", to: "app#sale_haocai"
  get "/app/sale_search/:keyword", to: "app#sale_search"

  get "/app/hot", to: "app#hot"
  post "/app/search", to: "app#search"

  # taobao
  #get "baobei/:id", to: "taobao#baobei"
  #get "youxuan/:keyword", to: "taobao#youxuan"
  #get "dian/:id", to: "taobao#dian"
  #get "product_map", to: "taobao#product_map"
  #get "shop_map", to: "taobao#shop_map"

end
