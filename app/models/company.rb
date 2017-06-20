class Company < ActiveRecord::Base
  belongs_to :user
  has_many :balances
  has_many :accounts
  has_one :chart_of_account, autosave: true, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :name, presence: true
  accepts_nested_attributes_for :chart_of_account, :address

  

  def address
    super || build_address
  end

  def self.consulta_cnpj cnpj
  	resposta = HTTP.get("https://www.receitaws.com.br/v1/cnpj/#{cnpj}")
  	if resposta.code.equal? 200
  		consulta = resposta.parse
      company = Company.new(name: consulta.values_at("nome").first.to_s, fantasy_name: consulta.values_at("fantasia").first.to_s, cnpj: consulta.values_at("cnpj").first.to_s, social_denomination: consulta.values_at("natureza_juridica").first.to_s, started_at: consulta.values_at("abertura").first.to_s, phone: consulta.values_at("telefone").first.to_s, capital: consulta.values_at("capital_social").first.to_s, tipo: consulta.values_at("tipo").first.to_s )

      company.address = Address.new(company_id: company.id, cep: consulta.values_at("cep").first.to_s, number: consulta.values_at("numero").first.to_s, street: consulta.values_at("logradouro").first.to_s, city: consulta.values_at("municipio").first.to_s, district: consulta.values_at("bairro").first.to_s, state: consulta.values_at("uf").first.to_s,)
      company
  	end
  end

end
