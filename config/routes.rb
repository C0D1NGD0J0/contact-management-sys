Rails.application.routes.draw do
  devise_for :users, path: 'auth', controllers: { registrations: :custom_registrations }, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
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
