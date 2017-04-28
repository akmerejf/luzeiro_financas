class CreateSencondaryActivities < ActiveRecord::Migration
  def change
    create_table :sencondary_activities do |t|
      t.text :description
      t.string :code
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
