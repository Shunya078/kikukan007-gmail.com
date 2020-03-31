class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :bungaku_url
      t.string :hou_url
      t.string :hoken_url
      t.string :keizai_url
      t.string :kou_url
      t.string :kyoiku_url
      t.string :rigaku_url
      t.string :nou_url
      t.string :zyohou_ri_url
      t.string :zyohou_bun_url

      t.timestamps null: false
    end
  end
end
