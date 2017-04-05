Rails.application.routes.draw do
  get '/scores' => 'scores#index'
  get '/scores/new' => 'scores#new'
  post '/scores' => 'scores#create'
  get '/scores/:id' => 'scores#show'
  get '/scores/:id/edit' => 'scores#edit'
  patch 'scores/:id' => 'scores#update'
  delete 'scores/:id' => 'scores#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
