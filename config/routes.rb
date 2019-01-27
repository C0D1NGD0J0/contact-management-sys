Rails.application.routes.draw do
  devise_for :users
  # get 'contacts/index', to: 'contacts#index', as: "contacts"
  # get 'contacts/new', to: 'contacts#new', as: 'new_contact'
  # get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  # patch 'contacts/:id', to: 'contacts#update', as: 'update_contact'
  # post 'contacts/create', to: 'contacts#create', as: 'create_contact'
  # delete 'contacts/:id', to: 'contacts#destroy', as: 'delete_contact'

  resources :contacts, except: [:show] do
  	get 'autocomplete', on: :collection
  end
  post "/groups", to: "groups#create"
  root to: 'home#index'
end
