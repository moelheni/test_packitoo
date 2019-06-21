Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do
    resources :comments
    resources :ratings
  end

  # setting homepage to welcome page
  root 'welcome#index'
end
