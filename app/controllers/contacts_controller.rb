class ContactsController < ApplicationController
    
    def new
        #instance variable
        @contact = Contact.new
        #Equivalente a {name:, email:, comments:}
    end
    
    #default name to save in rails
    def create
        @contact =  Contact.new(contact_params)
        if @contact.save
            redirect_to new_contact_path, notice: 'Contact saved'
        else
            redirect_to new_contact_path, notice: 'Error'
        end
    end
    
    #Security feature
    private
        def contact_params
            params.require(:contact).permit(:name,:email,:comments)
        end
    
end