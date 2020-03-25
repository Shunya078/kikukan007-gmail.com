# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_25_082916) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "bungaku_image"
    t.string "buturi_image"
    t.string "denzyo_image"
    t.string "eneri_image"
    t.string "hou_image"
    t.string "housya_image"
    t.string "kango_image"
    t.string "keizai_image"
    t.string "kasei_image"
    t.string "kensa_image"
    t.string "kentiku_image"
    t.string "kikou_image"
    t.string "konpixyuta_image"
    t.string "kyoiku_image"
    t.string "mate_image"
    t.string "ningen_image"
    t.string "ousei_image"
    t.string "rigaku_image"
    t.string "rigakuryoho_image"
    t.string "sagyoryoho_image"
    t.string "seibutu_image"
    t.string "sizen_image"
    t.string "sizenseibutu_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
