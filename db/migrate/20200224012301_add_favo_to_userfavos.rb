class AddFavoToUserfavos < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :favorite, :string
  end
end
