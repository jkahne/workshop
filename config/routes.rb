Rails.application.routes.draw do
  resources :posts do 
    resources :comments
    get 'ben', on: :collection,  to: 'comments#kurt'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
end
