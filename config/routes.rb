Rails.application.routes.draw do
  get 'anam/index' => 'anam#index'
  get '/get_anam_bob' => 'anam#get_anam_bob'

  root 'home#index'
  get '/' => 'home#index'
  get '/get_bob' => 'home#get_bob'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
