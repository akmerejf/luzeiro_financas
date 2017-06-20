class Ativo < ActiveRecord::Base
	belongs_to :account
	# before_create :create_accounts, scope: 'caixas'

  def self.types
    %w(Caixa Banco)
  end

  scope :caixas, -> { where(type: 'Caixa') } 
  scope :bancos, -> { where(type: 'Banco') } 

def create_accounts
  	ActiveRecord::Base.transaction do
  	  a1 = Account.find_or_create_by!(code: "1", name: "Ativo")
  	  a2 = Account.find_or_create_by!(code: "1.1", name: "Circulante", ancestry: a1)
  	  a3 = Account.find_or_create_by!(code: "1.1.1", name: "Disponível", ancestry: "#{a1.id}/#{a2.id}")
  	  a4 = Account.find_or_create_by!(code: "1.1.1.1", name: "Caixa", ancestry: "#{a1.id}/#{a2.id}/#{a3.id}")
  	  if a4.children.any?
  	  	a5 = Account.find_or_create_by(code: "1.1.1.1.#{a4.children.last.code.to_i + 1}", name: self.name, ancestry: "#{a1.id}/#{a2.id}/#{a3.id}/#{a4.id}")
  	  else
  	  	a5 = Account.find_or_create_by(code: "1.1.1.1.1}", name: self.name, ancestry: "#{a1.id}/#{a2.id}/#{a3.id}/#{a4.id}")
  	  end
  	  
  	end
  end
  
end
