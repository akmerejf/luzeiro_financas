class RemoveAddressFieldsFromCompanie < ActiveRecord::Migration
  def change
    remove_column :companies, :field_of_work, :string
    remove_column :companies, :address, :string
    remove_column :companies, :cep, :string
  end
end
