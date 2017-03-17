class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :name
      t.boolean :analytic, :null => false, :default => false
      t.text :description
      t.decimal :balance, precision: 10, scale: 2, :null => false, :default => 0
      t.timestamps null: false
    end
  end
end
