class AddNewFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :company, :string
    add_column :companies, :situation, :string
    add_column :companies, :last_update, :datetime
    add_column :companies, :status, :string
    add_column :companies, :tipo, :string
    add_column :companies, :email, :string
    add_column :companies, :efr, :string
    add_column :companies, :motive_situation, :string
    add_column :companies, :special_situation, :string
    add_column :companies, :special_situation_date, :date
    add_column :companies, :capital, :string
    add_column :companies, :situation_date, :date
  end
end
