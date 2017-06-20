class AddTypeToAtivo < ActiveRecord::Migration
  def change
    add_column :ativos, :type, :string
  end
end
