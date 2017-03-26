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

  def self.name_search search

    where("NAME like ?", search)
    
  end

  def self.ativo
      find_by(code: 1)
    
  end

  def self.passivo
      find_by(code: 2)
    
  end

  def self.receita
      find_by(code: 3)
  end

  def self.custo
      find_by(code: 4)
  end

  def self.despesa
      find_by(code: 5)
  end

  def self.analytic
      where(analytic: true)
    
  end

  def self.receita_operacional
    find_by(code: '3.1')
  end






end

