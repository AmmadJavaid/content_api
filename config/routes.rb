Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :content, only: [:index] do
        collection do
          get 'movies', action: 'movies'
          get 'seasons', action: 'seasons'
          post 'purcahse', action: 'purcahse'
          get 'library/:user_id', action: 'library'
        end
      end
    end
  end
end
