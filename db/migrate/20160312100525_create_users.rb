class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false                           # ユーザー名
      t.integer :chip, null: false  #チップ 
      t.boolean :administrator, null: false, default: false # 管理者フラグ

      t.timestamps null: false
    end
  end
end
