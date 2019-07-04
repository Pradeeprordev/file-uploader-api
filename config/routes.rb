Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do 
        collection do
          post :import_data
        end
      end
    end
 end
end
