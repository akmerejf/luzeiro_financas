class AddTaxationToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :taxation, :string
  end
end
