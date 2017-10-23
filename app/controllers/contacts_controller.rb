class ContactsController < ApplicationController
    
    # GET request to /contacts-us
    # Show new contact form
    def new
        #instance variable
        @contact = Contact.new
        # Equivalente a {name:, email:, comments:}
    end
    
    # POST request /contacts
    # default name to save in rails
    def create
        # Mass assignment of forms fields into Contact object
        @contact =  Contact.new(contact_params)
        # Save the Contact object to the database
        if @contact.save
            # Store form field via parameters, into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body =  params[:contact][:comments]
            # Plug variables into Contact Mailer email method and send email
            ContactMailer.contact_email(name,email,body).deliver
            # Store success mesage in flash hash
            flash[:success] = "Message sent"
            # Redirect to the new action
            redirect_to new_contact_path
        else
            # the errors came in an array
            # If Contact object doesnt save store error in flash hash, redirect
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    # Security feature, mass assignment
    private
        # To collect data from form, we need to use strong parameters
        # and whitelist the form fields
        def contact_params
            params.require(:contact).permit(:name,:email,:comments)
        end
    
end