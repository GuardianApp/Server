class ContactosController < ApplicationController
    
    before_action :find_contacto, only: [:show, :edit, :update, :destroy]
    
    def index
        @contactos = Contacto.all
    end
    
    def show
    end
    
    def new
        @contacto = Contacto.new
    end
    
    def create
        @contacto = Contacto.new(contacto_params)
        
        respond_to do |format|
            if @contacto.save
                format.html { redirect_to contactos_path, :flash => { :success => 'Contacto creado exitosamente.' } }
                format.json { render :show, status: :created, location: @contacto }
            else
                format.html { render 'new', :flash => { :danger => 'Hubo un error al tratar de crear el contacto.' } }
                format.json { render json: @contacto.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @contacto.update(contacto_params)
                format.html { redirect_to contactos_path, :flash => { :success => 'Contacto editado exitosamente.' } }
                format.json { render :show, status: :updated, location: @story }
            else
                format.html { render :edit, :flash => { :danger => 'Hubo un error al tratar de editar el contacto.' } }
                format.json { render json: @contacto.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        respond_to do |format|
            @contacto.destroy
            format.html { redirect_to contactos_path, :flash => { :success => 'Contacto eliminado exitosamente.' } }
            format.json { redirect_to contactos_path, status: :destroyed, location: @contacto }
        end
    end
    
    private
        
        def find_contacto
            @contacto = Contacto.find(params[:id])
        end
    
        def contacto_params
           params.require(:contacto).permit(:nombre_completo, :telefono, :movil, :email, :direccion) 
        end
end
