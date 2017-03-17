class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :value, precision: 10, scale: 2
      t.integer :nature
      t.references :account, index: true, foreign_key: true
      t.references :operation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
