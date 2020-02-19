class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.string :comment
      t.string :img
      t.string :sample
      t.integer :user_id

      t.timestamps null: false
      end
    end
end
