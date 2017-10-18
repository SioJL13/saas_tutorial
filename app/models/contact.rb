class Contact < ActiveRecord::Base
    #Revisa la BD (schema) para ver que atributos debe de contener la clase
    #Blueprint principal, aqui se pueden hacer validaciones
    
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
    
end