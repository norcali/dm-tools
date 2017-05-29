Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#show"

  resources :characters do
	  get 'pdf', on: :member
    get 'sheet', on: :member
	end

  resources :abilities
  resources :character_stats
  resources :character_classes
end
