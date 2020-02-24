class AddFavoToUserfavos < ActiveRecord::Migration[5.2]
  def change
    add_column :userfavos, :favorite, :boolean
  end
end
