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

ActiveRecord::Schema.define(version: 2019_10_24_152318) do

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

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "管理者", force: :cascade do |t|
    t.string "user_cd", limit: 40, null: false, comment: "ユーザコード"
    t.string "name", limit: 30, null: false, comment: "名前"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["user_cd"], name: "index_admins_on_user_cd"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructor_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "インストラクター", force: :cascade do |t|
    t.string "user_cd", limit: 40, null: false, comment: "ユーザコード"
    t.integer "address_id", null: false, comment: "住所ID"
    t.integer "document_id", comment: "ドキュメントID"
    t.integer "genre_id", null: false, comment: "ジャンルID"
    t.string "name", limit: 30, null: false, comment: "名前"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "encrypted_password", default: "", null: false, comment: "パスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at", comment: "論理削除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_instructor_users_on_address_id"
    t.index ["document_id"], name: "index_instructor_users_on_document_id"
    t.index ["email"], name: "index_instructor_users_on_email", unique: true
    t.index ["genre_id"], name: "index_instructor_users_on_genre_id"
    t.index ["reset_password_token"], name: "index_instructor_users_on_reset_password_token", unique: true
    t.index ["user_cd"], name: "index_instructor_users_on_user_cd"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "一般ユーザ", force: :cascade do |t|
    t.string "user_cd", limit: 40, null: false, comment: "ユーザコード"
    t.integer "address_id", null: false, comment: "住所ID"
    t.string "document_id", comment: "ドキュメントID"
    t.integer "genre_id", null: false, comment: "ジャンルID"
    t.string "name", limit: 30, null: false, comment: "名前"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "encrypted_password", default: "", null: false, comment: "パスワード"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at", comment: "論理削除"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["document_id"], name: "index_users_on_document_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["genre_id"], name: "index_users_on_genre_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_cd"], name: "index_users_on_user_cd"
  end

end
