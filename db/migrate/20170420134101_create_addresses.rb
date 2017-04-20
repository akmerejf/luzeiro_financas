class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :company, index: true, foreign_key: true
      t.string :cep
      t.string :number
      t.string :street
      t.string :district
      t.string :state

      t.timestamps null: false
    end
  end
end
