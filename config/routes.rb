Rails.application.routes.draw do
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

root 'items#top'
get '/user_password_edit/:id' => "users#user_password_edit", as:'user_password_edit'

resources :categories, only: [:index, :edit, :new, :create, :update]
resources :items, only: [:index, :show, :new, :create, :edit, :update,:destroy] do
	resources :reviews, only: [:create, :new,:index]
  resources :iines, only: [:create, :destroy]
end
resources :makers, only: [:index, :edit, :new, :create, :update]
resources :users, only: [:show, :edit, :update,:destroy] do
  member do
     get :following, :followers
    end
  end
resources :relationships,only: [:create, :destroy]
resources :admins, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
