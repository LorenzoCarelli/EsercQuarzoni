Rails.application.routes.draw do
  devise_for :users
	resources :movies do
		resources :reviews, only: [:new, :create, :destroy]
	end
	resources :moviegoers
	
	root :to  => redirect('/movies')
end
