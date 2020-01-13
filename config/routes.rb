Rails.application.routes.draw do
  root 'landings#index'

  post "/usertype_auth" => "landings#usertype_auth", as: :usertype_authentication

  resources :invoices, except: [ :delete ] do
    member { post :mark_as_digitized }
    # resources :line_items, only: [ :index ]
  end
end
