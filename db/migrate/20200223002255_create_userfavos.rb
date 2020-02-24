class CreateUserfavos < ActiveRecord::Migration[5.2]
  def change
     create_table :userfavos do |t|
      t.integer :user_id
      t.integer :music_id
      t.timestamps null: false
    end
  end
end
