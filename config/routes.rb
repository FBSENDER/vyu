Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "guize#yumaoqiu"
  get "/article/", to: "article#index"
  get "/article/:id", to: "article#show"
  get "/article/:id/update", to: "article#update"
  post "/article/publish", to: "article#publish"
end
