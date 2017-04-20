class Company < ActiveRecord::Base
  belongs_to :user
  has_many :balances
  has_many :accounts, through: :balances
  has_one :chart_of_account, autosave: true, dependent: :destroy

  validates :chart_of_account, :name, presence: true
  accepts_nested_attributes_for :chart_of_account

end
