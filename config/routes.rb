Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :doses, only: [:create, :destroy]
  end
  root "cocktails#index"

end
