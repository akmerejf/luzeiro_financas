class Balance < ActiveRecord::Base
  belongs_to :account
  belongs_to :operation

  def self.date_search init, final
      where(created_at: init..final)
  end
  
end
