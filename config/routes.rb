Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # Sign-up/login routes
  get '/welcome', to: 'welcome#index'
  post '/welcome', to: 'welcome#create'
  delete '/welcome', to: 'welcome#destroy'

  # Logged in routes
  # get '/categories', to: 'categories#index', as 'categories'
  resources :categories do
    # get 'categories/:category_id/questions', as 'category_questions'
    # post 'categories/:category_id/questions'
    resources :questions do
      # get 'categories/:category_id/questions/:question_id/answers', as 'category_question_answers'

      resources :answers
    end
  end
end
