class Operation < ActiveRecord::Base
	  belongs_to :release_account, class_name: "Account"
    belongs_to :retrieve_account, class_name: "Account"

    has_many :balances, dependent: :destroy
    has_many :accounts, through: :balances

    

  def authorize
    unless destroyed?     
		Balance.create(operation: self, account: self.retrieve_account, value:  self.value, nature: 1)
		Balance.create(operation: self, account: self.release_account, value: - self.value, nature: -1)
    end
  end

  def authorized?
      self.balances.any? ? true : false      
  end

  def credit_balance account
         balance = balances.find_by(account: account)
        if balance && balance.nature < 0
           balance.value
        else
           0
        end
    end

  def debit_balance account
      
        balance = balances.find_by(account: account)
        if balance && balance.nature > 0
           balance.value
        else
           0
        end
      
  end 

  def self.date_search init, final
      where(operation_date: init..final)
  end

  def self.operations_by_date init, final
        value = 0.0
        where(operation_date: init..final).each do |op|
          value += op.balances.sum(:value)
        end
        value
  end

  


end
