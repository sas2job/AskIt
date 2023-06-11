Rails.application.routes.draw do
  get '/questions', to: 'questions#index'
  
  get '/questions/new', to: 'questions#new'

  post '/questions/', to: 'questions#create'

  root "pages#index"
end
