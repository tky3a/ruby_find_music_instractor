# frozen_string_literal: true

class DeviseCreateInstructorUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :instructor_users, comment: "インストラクター" do |t|
      t.string :user_cd, limit: 40, index: true, foreign_key: true, null: false, comment: "ユーザコード"
      t.integer :address_id, index: true, null: false, comment: "住所ID"
      t.integer :document_id, index: true, comment: "ドキュメントID"
      t.integer :genre_id, index: true, null: false, comment: "ジャンルID"
      t.string :name, limit: 30, null: false, comment: "名前"
      ## Database authenticatable
      t.string :email,              null: false, default: "", comment: "メールアドレス"
      t.string :encrypted_password, null: false, default: "", comment: "パスワード"

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.datetime :deleted_at, comment: "論理削除"

      t.timestamps null: false
    end

    add_index :instructor_users, :email,                unique: true
    add_index :instructor_users, :reset_password_token, unique: true
    # add_index :instructor_users, :confirmation_token,   unique: true
    # add_index :instructor_users, :unlock_token,         unique: true
  end
end