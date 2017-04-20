class AddFieldsToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :fantasy_name, :string
    add_column :companies, :social_denomination, :string
    add_column :companies, :phone, :string
    add_column :companies, :state_insc, :string
    add_column :companies, :local_insc, :string
    add_column :companies, :suprama, :string
    add_column :companies, :nire, :string
    add_column :companies, :started_at, :date

  end
end
