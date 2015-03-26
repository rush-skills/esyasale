Rails.application.routes.draw do
  resources :tickets, only: [:index, :new]

  resources :sales, except: [:show]

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  resources :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	devise_scope :user do
	  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
	  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	end

  get '/dashboard', to: 'tickets#dashboard', as: 'dashboard'
  get '/tickets/:id/paid', to: 'tickets#paid', as: 'paid'
  get '/tickets/:id/blocked', to: 'tickets#blocked', as: 'blocked'
end
