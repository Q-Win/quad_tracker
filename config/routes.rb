Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "data#home"
  get 'updatematches', to: 'data#updatematches'
  get 'addchamps', to: 'champions#addchamps'
  get 'addchampionstomatches', to: 'champions#addchampionstomatches'

  resources :champions, only: [:show, :index]

end
