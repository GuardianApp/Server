class Contacto < ActiveRecord::Base
    
    has_many :denuncias, dependent: :destroy
end
