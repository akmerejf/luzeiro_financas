class AddOperationNatureToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :operation_nature, :string
  end
end
