Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # afficher la liste de toutes les taches
  get '/tasks', to: 'tasks#index'
  # afficher le formulaire task (new)
  get '/tasks/new', to: 'tasks#new'
  # gérer la requête POST générée lors de l’envoi du formulaire
  post '/tasks', to: 'tasks#create'
  # get pour pouvoir editer une tache STEP 1
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'task_edit'
  # patcher l'edit STEP 2
  patch 'tasks/:id', to: 'tasks#update'
  # supprimer une tache
  delete 'tasks/:id', to: 'tasks#destroy'
  # afficher une tache via son id
  get '/tasks/:id', to: 'tasks#show', as: 'task'
end
