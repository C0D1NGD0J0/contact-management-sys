Rails.application.routes.draw do
  get 'contacts/index', to: 'contacts#index', as: "contacts"
  get 'contacts/new', to: 'contacts#new', as: 'new_contact'
  get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  patch 'contacts/:id', to: 'contacts#update', as: 'update_contact'
  post 'contacts/create', to: 'contacts#create', as: 'create_contact'
  root to: 'home#index'
end
