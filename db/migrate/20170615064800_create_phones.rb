class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :address, foreign_key: true
      t.string :number, null: false                   # 電話番号
      t.string :number_for_index, null: false         # 索引用電話番号
      t.boolean :primary, null: false, default: false # 優先フラグ

      t.timestamps
    end

    add_index :phones, :number_for_index
  end
end
