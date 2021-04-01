class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bungaku_image
      t.string :butsuri_image
      t.string :denzyo_image
      t.string :eneri_image
      t.string :hou_image
      t.string :housya_image
      t.string :kango_image
      t.string :keizai_image
      t.string :kasei_image
      t.string :kensa_image
      t.string :kentiku_image
      t.string :kikou_image
      t.string :konpixyuta_image
      t.string :kyoiku_image
      t.string :mate_image
      t.string :ningen_image
      t.string :ousei_image
      t.string :rigaku_image
      t.string :rigakuryoho_image
      t.string :sagyoryoho_image
      t.string :seibutu_image
      t.string :sizen_image
      t.string :sizenseibutu_image

      t.timestamps
    end
  end
end
