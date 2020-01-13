Rails.application.routes.draw do
  root 'landings#index'

  post "/usertype_auth" => "landings#usertype_auth", as: :usertype_authentication

  resources :invoices, except: [ :delete ] do
    member do
      post :mark_as_digitized
      get :add_line_item
    end

    collection do
      get :add_line_item
    end

    # resources :line_items, only: [ :index ]
  end
end
