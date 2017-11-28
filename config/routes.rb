Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      post '/create_comment' => 'posts#create_comment', as: 'create_comment_to'
      post '/like_post' => 'posts#like_post', as: 'like_to'
    end
    collection do
      delete '/:comment_id/destroy_comment' => 'posts#destroy_comment', as: 'destroy_comment'
    end
  end

  root 'posts#index'

end
