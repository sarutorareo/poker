class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :no, null: false  # 部屋番号
      t.integer :max_user, null: false, default: 9 # 最大人数
      t.string :pass # パスワード

      t.timestamps null: false
    end
  end
end
