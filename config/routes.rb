Rails.application.routes.draw do

  resources :launchers, only: [:index, :show, :update, :destroy]
  root :to => "root#index"

end
