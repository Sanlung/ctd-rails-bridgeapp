Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # Sign-up/login routes
  get 'welcome', to: 'welcome#index', as: 'welcome'
  post 'welcome', to: 'welcome#create'
  get 'welcome/new', to: 'welcome#new', as: 'new_welcome'
  delete 'welcome', to: 'welcome#destroy'

  # Category routes
  resources :categories do
    # get 'categories', to: 'categories#index', as: 'categories'

    resources :questions do
      # get 'categories/category_id/questions', to: 'questions#index', as: 'category_questions'
      # post 'categories/category_id/questions', to: 'questions#create'
      # get 'categories/category_id/questions/new', to: 'questions#new', as: 'new_category_question'
      # get 'categories/category_id/questions/questino_id', to: 'questinos#show', as: 'categoryquestion'
      # get 'categories/category_id/questions/questino_id/edit', to: 'questinos#edit', as: 'edit_category_question'
      # patch 'categories/category_id/questions/question_id', to: 'question#update'
      resources :answers
      # get 'categories/category_id/questions/question_id/anwsers, to: 'answers#index', as 'category_question_answers'
      # post 'categories/category_id/questions/question_id/anwsers, to: 'answers#create
      # get 'categories/category_id/questions/question_id/answers/new, to: 'answers#new', as: 'new_category_question_answer'
      # get 'categories/category_id/questions/question_id/answers/:id, to: 'answer#show', as: 'category_question_answer'
      # get 'categories/category_id/questions/question_id/answers/:id/edit, to: 'answer#edit', as: 'edit_category_question_asnwer'
      # patch 'categories/category_id/questions/question_id/answers/:id', to: 'answer#update'
      # delete 'categories/category_id/questions/question_id/answer/:id, to 'answer#destroy'
    end
  end
end
