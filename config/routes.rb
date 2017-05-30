Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#show"

  resources :characters do
	  get 'pdf', on: :member
    get 'sheet', on: :member
	end

  resources :character_stats do
  	get 'skills', on: :member
  	patch 'done', on: :member
  end
end
