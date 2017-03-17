class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.decimal :value, precision: 10, scale: 2
      t.string :description
      t.references :release_account, index: true
      t.references :retrieve_account, index: true
      t.date :operation_date

      t.timestamps null: false
    end
  end
end
