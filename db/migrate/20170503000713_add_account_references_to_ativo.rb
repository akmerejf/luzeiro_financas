class AddAccountReferencesToAtivo < ActiveRecord::Migration
  def change
    add_reference :ativos, :account, index: true, foreign_key: true
  end
end
