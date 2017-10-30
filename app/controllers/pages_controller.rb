class PagesController < ApplicationController
    
    #Controller#action
    #This is the controller and the action is home
    # GET request for / which is our home page
    def home
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
    
end