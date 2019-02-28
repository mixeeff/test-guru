Rails.application.routes.draw do

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
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end

  get 'admin', to: 'admin/tests#index'

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  get 'tests/:id/questions', to: 'tests#show'
  get 'questions/:id/answers', to: 'questions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
