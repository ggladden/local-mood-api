Rails.application.routes.draw do
  resources :sentiments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :regions do
    resources :sentiments
    collection do
      get 'search'
    end
  end
end
