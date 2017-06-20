class CreateAtivos < ActiveRecord::Migration
  def change
    create_table :ativos do |t|
      t.string :name
      t.boolean :curto_prazo
      t.boolean :longo_prazo
      t.boolean :investimento
      t.boolean :imobilizado
      t.boolean :intangivel
      t.string :natureza_conta

      t.timestamps null: false
    end
  end
end
