Rails.application.routes.draw do

  resources :badges, only: %i[index show]

  devise_for :users, :controllers => { sessions: 'sessions' }

  devise_scope :admin do
    get 'login', to: 'devise/sessions#new'
  end

  root to: 'tests#index'

  resources :tests, only: :index do
    post :start, on: :member
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: :index
    resources :badges
  end

  get 'admin', to: 'admin/tests#index'

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :users_badges, only: :index

  resources :feedbacks, only: [:new, :create]

  get 'tests/:id/questions', to: 'tests#show'
  get 'questions/:id/answers', to: 'questions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
