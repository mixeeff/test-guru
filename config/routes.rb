Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  get 'tests/:id/questions', to: 'tests#show'
  get 'questions/:id/answers', to: 'questions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
