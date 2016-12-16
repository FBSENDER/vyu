Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "guize#yumaoqiu"
  get "/article/", to: "article#index"
  get "/article/:id", to: "article#show"
  get "/article/:id/update", to: "article#update"
  post "/article/publish", to: "article#publish"

  get "/app/video", to: "app#video"
  get "/app/tag/:name", to: "app#tag"

  get "/app/article_list", to: "app#article_list"
  get "/app/content/:id", to: "app#content"

  get "/app/sale_pai", to: "app#sale_pai"
  get "/app/sale_xie", to: "app#sale_xie"
  get "/app/sale_qiu", to: "app#sale_qiu"
  get "/app/sale_haocai", to: "app#sale_haocai"
  get "/app/sale_search/:keyword", to: "app#sale_search"
end
