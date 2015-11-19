class AddNombreCompletoToContactos < ActiveRecord::Migration
  def change
    add_column :contactos, :nombre_completo, :string
  end
end
