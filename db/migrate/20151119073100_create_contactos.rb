class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :telefono
      t.string :movil
      t.string :direccion
      t.string :facebook
      t.string :email

      t.timestamps null: false
    end
  end
end
