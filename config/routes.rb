Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users do
  #   resources :gyms do
  #     resources :posts do
  #       resources :comments
  #     end
  #   end
  # end

  resources :posts do
    resources :comments
  end
resources :gyms

end
