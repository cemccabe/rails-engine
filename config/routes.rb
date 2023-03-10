Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        resources :find, only: [:index]
      end

      resources :merchants, only: [:index, :show] do
        scope module: 'merchants' do
          resources :items, only: [:index]
        end
      end

      resources :items do
        scope module: 'items' do
          resources :merchant, only: [:index]
        end
      end
      
    end
  end
end
