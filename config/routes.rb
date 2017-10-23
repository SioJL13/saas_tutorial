Rails.application.routes.draw do
    
  devise_for :users
    #root is pointing to homepage
    #Go to the pages controller and execute the home action
    root to: 'pages#home'
    
    get 'about', to: 'pages#about'
    
    #Onlye get create endpoint when running rails routes
    resources :contacts, only: :create
    get 'contact-us', to: 'contacts#new', as: 'new_contact'
    
end
