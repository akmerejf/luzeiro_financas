class ResultController < ApplicationController
	before_action :set_accounts, only: [:show]
	def index
		if params[:date_init] and params[:date_final]
			redirect_to action: :show, params: params
		end
	end

	def show
		
	end

	def set_accounts
	  @init_date = params[:date_init].to_date.strftime("%Y/%m/%d") 
      @final_date = params[:date_final].to_date.strftime("%Y/%m/%d") 

      @receita = Account.receita.descendants.analytic
      @custo_despesa = Account.custo_despesa.descendants.analytic

      
    end
end
