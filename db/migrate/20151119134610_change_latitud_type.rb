class ChangeLatitudType < ActiveRecord::Migration
  def change
    change_column :denuncias, :latitud, :decimal, {:precision=>10, :scale=>6}
  end
end
