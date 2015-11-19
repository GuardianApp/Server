class DenunciasController < ApplicationController
    
    def index
        @denuncias = Denuncia.all
        
        respond_to do |format|
            format.html {}
           format.json { render json: @denuncias } 
        end
    end
    
    def new
        @denuncia = Denuncia.new
    end
    
    def create
        @denuncia = Denuncia.new(denuncia_params)
        
        respond_to do |format|
            if @denuncia.save
                format.html { redirect_to denuncias_path, :flash => { :success => 'Denuncia creada exitosamente.' } }
                format.json { render :show, status: :created, location: @denuncia }
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de crear la denuncia.' } }
                format.json { render json: @denuncia.errors, status: :unprocessable_entity }
            end
        end
    end
    
    private
    
        def denuncia_params
            params.require(:denuncia).permit(:descripcion, :latitud, :longitud, :contacto_id)
        end
end
