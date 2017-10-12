Rails.application.routes.draw do
    
    #root is pointing to homepage
    root to: 'pages#home'
    
    get 'about', to: 'pages#about'
    
end
