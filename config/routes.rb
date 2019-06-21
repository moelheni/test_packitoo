Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles

  # setting homepage to welcome page
  root 'welcome#index'
end
