Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: "#index"
  end

  # Main pages
  root to: 'main#index'

  # Info pages
  scope '/about' do
    get 'about_us', to: 'main#about_us',    as: :about_us
    get '/privacy', to: 'main#privacyinfo', as: :privacy_policy
  end

  # User-centric stuff
  scope '/my' do
    get '/content', to: 'main#dashboard', as: :dashboard
  end

  # Sessions
  get '/login',  to: 'sessions#new',     as: :login
  post '/login', to: 'sessions#create',  as: :login_process
  get '/logout', to: 'sessions#destroy', as: :logout

end
