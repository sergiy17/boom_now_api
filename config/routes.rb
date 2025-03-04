Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
    namespace :api do
      resources :listings, only: [] do
        collection do
          get 'search'
        end
      end
    end
  end

end
