Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/users", to: "users#create"
      delete "/users/:id", to: "users#delete"
    end
  end
end
