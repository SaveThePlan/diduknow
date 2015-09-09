Rails.application.routes.draw do

  devise_for :users

  resources :courses
  resources :chapters

  root 'courses#index'

  resources :users, only: [:index] do
    post 'act_as', on: :member
    delete 'myself_again', on: :collection
  end

end
