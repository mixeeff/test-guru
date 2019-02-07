Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, except: :index, shallow: true
  end

  get 'tests/:id/questions', to: 'tests#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
