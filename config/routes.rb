Rails.application.routes.draw do
  root to: "homepages#show"

  resources :clues, only: [:show], param: :location
end
