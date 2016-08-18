Rails.application.routes.draw do
  get 'colleges/index'

  get 'colleges/show'

  get 'colleges/search'

  get 'colleges/details'

	root 'colleges#index'
  get 'welcome' => 'welcome/index'

  resources :users, only: [:show] do
    resources :colleges, only: [:index, :show, :create, :destroy], shallow: true do
    	resources :notes, only: [:edit, :create, :update, :destroy], shallow: true
    	end
  end

  # search colleges route
  get 'search' => 'colleges#search' # search_path => /search

  # college details route
  get 'details/:college_id' => 'colleges#details', as: 'details' # details_path(:id) => /details/:id

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
