Rails.application.routes.draw do

  devise_for :users
	root 'welcome#index'
  get 'welcome' => 'welcome#index'
  get 'instructions' => 'welcome#instructions'

  resources :users, only: [:show] do
    resources :colleges, except: [:new, :edit], shallow: true do
    	resources :notes, only: [:edit, :create, :update, :destroy], shallow: true
    	end
  end

  # search colleges route
  get 'search' => 'colleges#search' # search_path => /search
  get 'add_colleges' => 'colleges#add'
  # college details route
  get 'details/:id' => 'colleges#details', as: 'details' # details_path(:id) => /details/:id

  get 'reset' => 'colleges#reset'
  get 'untier/:id' => 'colleges#untier', as: 'untier'
  # get 'toggle/:id' => 'checklists#toggle', as: 'toggle'
  post 'favorite/:id' => 'colleges#favorite', as: 'favorite'
  get '/colleges/:id/update/:attr' => 'checklists#toggle', as: 'toggle'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
