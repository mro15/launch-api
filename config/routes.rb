Rails.application.routes.draw do

  #get "/launchers", to: "launchers#index"
  #put "/launchers/:launchId", to: "launchers#update"
  resources :launchers, only: [:index, :show, :update, :destroy]

end
