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
            flash[:success] = "Contact saved"
            redirect_to new_contact_path
        else
            #the errors came in an array
            flash[:error] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    #Security feature, mass assignment
    private
        def contact_params
            params.require(:contact).permit(:name,:email,:comments)
        end
    
end