Rails.application.routes.draw do
  root 'dashboard#index'

  devise_scope :user do
    get "/sign_up" => "devise/registrations#new", as: :new_user_registration
    get '/sign_in', to: 'devise/sessions#new', as: :new_user_session
    post '/sign_in', to: 'devise/sessions#create', as: :user_session
    delete '/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, controllers: {:registrations => :registrations}, skip: [:sessions]
  resources :users, :only => ['index', 'show']
end
