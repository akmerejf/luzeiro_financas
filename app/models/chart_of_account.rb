class ChartOfAccount < ActiveRecord::Base
  has_many :accounts
  belongs_to :company
end
