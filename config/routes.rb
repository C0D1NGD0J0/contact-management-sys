Rails.application.routes.draw do
  get 'contacts/index', to: 'contacts#index', as: "contacts"
  root to: 'home#index'
end
