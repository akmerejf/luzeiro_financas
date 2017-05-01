class ResultController < ApplicationController
	before_action :set_accounts, only: [:show]
	def index
		if params[:date_init] and params[:date_final]
			redirect_to action: :show, params: params
		else
			params[:date_init] = Time.now.beginning_of_year
			params[:date_final] = Time.now
			redirect_to action: :show, params: params
		end

	end

	def show
		
	end

	def set_accounts
	  @init_date = params[:date_init].to_date.strftime("%Y/%m/%d") 
      @final_date =  params[:date_final].to_date.strftime("%Y/%m/%d") 

      if Account.receita
	      @receita_operacional = Account.receita.descendants.analytic 
	      @receita_bruta = 0
	      @receita_operacional.each{|r| r.operations.where(operation_date: @init_date..@final_date).each {|op| @receita_bruta += op.balances.where(nature: 1).sum(:value)}}
	  end

	  if Account.custo
	      @custos = Account.custo.descendants.analytic
	      @custo_total = 0
	      @custos.each{|c| c.operations.where(operation_date: 1.month.ago..Time.now).each {|op| @custo_total += op.balances.sum(:value)}}
  	  end
  	  if Account.despesa
	      @despesas_operacionais = Account.despesa.descendants.analytic
	      @despesa_total = 0
	      @despesas_operacionais.each{|d| d.operations.where(operation_date: 1.month.ago..Time.now).each {|op| @despesa_total += op.balances.sum(:value)}}
      end
    end
end
