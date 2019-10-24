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

ActiveRecord::Schema.define(version: 2019_10_23_150629) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "住所", force: :cascade do |t|
    t.string "user_cd", limit: 40, null: false, comment: "ユーザコード"
    t.integer "first_code", limit: 3, null: false, comment: "郵便番号の始め(3桁)"
    t.integer "last_code", null: false, comment: "郵便番号の後ろ(4桁)"
    t.string "prefecture", limit: 10, null: false, comment: "都道府県"
    t.string "city", comment: "市区町村"
    t.string "address", comment: "その他の住所"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_cd"], name: "index_addresses_on_user_cd"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
