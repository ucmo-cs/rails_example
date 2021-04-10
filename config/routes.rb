Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
	  get '/cars/make/:make', to: 'cars#make'
      resources :cars do
      end
    end
  end
end
