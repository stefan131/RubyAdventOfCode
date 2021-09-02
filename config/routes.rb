Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/calculate", to: "calc#index"
  get "/ex1", to: "ex1#index"
  get "/ex2", to:"ex2#index"
  get "/ex3", to:"ex3#index"
end
