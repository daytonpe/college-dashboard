Rails.application.routes.draw do
  get 'colleges/index'

  get 'colleges/show'

  get 'colleges/search'

  get 'colleges/details'

	root 'welcome#index'
  get 'welcome' => 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
