CdnControl::Application.routes.draw do
  root :to => "libraries#index"
  devise_for :users
  resources :users do
    member do
      put 'set_roles'
    end
  end
  resources :libraries
  match '/terms_of_use' => 'home#terms_of_use'
  match '/about_this_service' => 'home#about_this_service'
end