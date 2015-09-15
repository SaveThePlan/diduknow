Rails.application.routes.draw do

  devise_for :users

  resources :courses, shallow: true do
    resources :chapters, shallow: true do
      resources :lessons
    end
  end


  root 'courses#index'

  resources :users, only: [:index] do
    post 'act_as', on: :member
    delete 'myself_again', on: :collection
  end

end
