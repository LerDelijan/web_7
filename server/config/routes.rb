Rails.application.routes.draw do
  get '/todos', to: 'todos#index'
  post '/todos/add', to: 'todos#add'
  post '/todos/done', to: 'todos#change_done'
  delete '/todos', to: 'todos#delete_all'
end
