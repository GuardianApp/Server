class DenunciasController < ApplicationController

    before_action :find_denuncia, only: [:show, :edit, :update, :destroy]
    
    def index
        @denuncias = Denuncia.all
        
        @hash = Gmaps4rails.build_markers(@denuncias) do |denuncia, marker|
            marker.lat denuncia.latitud
            marker.lng denuncia.longitud
            marker.infowindow denuncia.descripcion
            
        end
        
        respond_to do |format|
            format.html {}
            format.json { render json: @hash.to_json } 
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
    
    def edit
    end
    
    def update
       respond_to do |format|
            if @denuncia.update(denuncia_params)
                format.html { redirect_to denuncias_path, :flash => { :success => 'Denuncia editada exitosamente.' } }
                format.json { render :show, status: :updated, location: @denuncia }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar la denuncia.' } }
                format.json { render json: @denuncia.errors, status: :unprocessable_entity }
            end
        end 
    end
    
    def destroy
       respond_to do |format|
            @denuncia.destroy
            format.html { redirect_to denuncias_path, :flash => { :success => 'Contacto eliminado exitosamente.' } }
            format.json { redirect_to denuncias_path, status: :destroyed, location: @denuncia }
        end 
    end
    
    private
        
        def find_denuncia
            @denuncia = Denuncia.find(params[:id])
        end
        
        def denuncia_params
            params.require(:denuncia).permit(:descripcion, :latitud, :longitud, :contacto_id)
        end
end
