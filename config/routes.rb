Rails.application.routes.draw do

  devise_for :users

  resources :courses, shallow: true do
    resources :chapters, shallow: true do
      resources :lessons, shallow: true do
        resources :questions do
          get :play, on: :collection
        end
      end
    end
  end


  root 'courses#index'

  resources :users, only: [:index] do
    post 'act_as', on: :member
    delete 'myself_again', on: :collection
  end

end
