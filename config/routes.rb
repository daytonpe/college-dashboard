Rails.application.routes.draw do
  get 'notes/create'

  get 'notes/edit'

  get 'notes/update'

  get 'notes/destroy'

  devise_for :users
	root 'welcome#index'
  get 'welcome' => 'welcome#index'

  resources :users, only: [:show] do
    resources :colleges, only: [:index, :show, :create, :destroy], shallow: true do
    	resources :notes, only: [:edit, :create, :update, :destroy], shallow: true
    	end
  end

  # search colleges route
  get 'search' => 'colleges#search' # search_path => /search
  get 'add_colleges' => 'colleges#add'
  # college details route
  get 'details/:name' => 'colleges#details', as: 'details' # details_path(:name) => /details/:name

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
