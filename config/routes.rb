Rails.application.routes.draw do
    
    #root is pointing to homepage
    #Go to the pages controller and execute the home action
    root to: 'pages#home'
    
    get 'about', to: 'pages#about'
    
    resources :contacts
    get 'contact-us', to: 'contacts#new'
    
end
