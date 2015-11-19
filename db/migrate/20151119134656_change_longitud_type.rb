class ChangeLongitudType < ActiveRecord::Migration
  def change
    change_column :denuncias, :longitud, :decimal, {:precision=>10, :scale=>6}
  end
end
