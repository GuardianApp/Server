class CreateDenuncias < ActiveRecord::Migration
  def change
    create_table :denuncias do |t|
      t.string :descripcion
      t.string :latitud
      t.string :longitud
      t.integer :contacto_id

      t.timestamps null: false
    end
  end
end
