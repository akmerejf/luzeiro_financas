class AddCompanyReferencesToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :company, index: true, foreign_key: true
  end
end
