class CreateQsas < ActiveRecord::Migration
  def change
    create_table :qsas do |t|
      t.string :which
      t.string :name
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
