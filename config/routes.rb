Bitly::Application.routes.draw do

  root 'links#new'
  
  get '/:bitly_link' => 'links#redirect'

  resources :links, only: [:new, :create]

end
