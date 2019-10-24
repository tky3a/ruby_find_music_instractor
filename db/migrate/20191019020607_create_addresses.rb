class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, comment: "住所" do |t|
      t.string :user_cd, limit: 40, index: true, foreign_key: true, null: false, comment: "ユーザコード"
      t.integer :first_code, limit: 3, null: false, comment: "郵便番号の始め(3桁)"
      t.integer :last_code, limit: 4, null: false, comment: "郵便番号の後ろ(4桁)"
      t.string :prefecture, limit: 10, null: false, comment: "都道府県"
      t.string :city, comment: "市区町村"
      t.string :address, comment: "その他の住所"

      t.timestamps
    end
  end
end
