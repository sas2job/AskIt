Rails.application.routes.draw do
  resources :questions, only: %i[index new edit create]
  root "pages#index"
end
