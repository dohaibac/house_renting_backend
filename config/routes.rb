Rails.application.routes.draw do
	resources :session, only: [:create, :destroy], default: {format: :json}
  resources :houses
  resources :user, only: [:create, :show], default: {format: :json}
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match 'fblogin' => 'session#fblogin', :as => :fblogin, :via => :post
end
