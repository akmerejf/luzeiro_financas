class Account < ActiveRecord::Base
  
  has_ancestry
  has_many :balances, dependent: :destroy
  has_many :operations, through: :balances
  
  before_create :account_name, :account_code
  
  def account_name

  	unless root?
  		
  		self.name = "#{self.parent.name} #{self.name}"
    else
      self.name
  	end
  	
  end

  def account_code

    unless root?
      self.code = "#{self.parent.code}.#{self.code}"
    end
    
  end

  def balance_value account
      n = 0
      if account.children?
        account.descendants.where(analytic: true).each {|d| n += d.balances.sum(:value)}
        n
      else
        if account.analytic?
           account.balances.sum(:value)
        end
      end
  end



end

