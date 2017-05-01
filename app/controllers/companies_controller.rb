class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    
    if params[:bcnpj]
      consulta = Company.consulta_cnpj(params[:bcnpj])
      if consulta
        @company = consulta
      end
         
    else
       respond_to do |format|
          @company = Company.new
          format.html { render :new, notice: "CNPJ inválido."}
        end
    end

    # @chart_of_account = @company.build_chart_of_account
  end

  # GET /companies/1/edit
  def edit
    @chart_of_account = @company.build_chart_of_account if @company.chart_of_account.nil?
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def busca_cnpj

      
    end
   
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :cnpj, :social_denomination, :taxation, :operation_nature, :situation, :email, :tipo, :special_situation, :situation_date, :motive_situation, :phone, :state_insc, :suprama, :started_at, :user_id, address_attributes: [:id, :cep, :number, :street, :district, :state, :city, :company_id], chart_of_account_attributes: [:id, :title, :company_id])
    end
end
