class AtivosController < ApplicationController
  before_action :set_ativo, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  # GET /ativos
  # GET /ativos.json
  def index
    @ativos = type_class.all
  end

  # GET /ativos/1
  # GET /ativos/1.json
  def show
  end

  # GET /ativos/new
  def new
    @ativo = type_class.new
  end

  # GET /ativos/1/edit
  def edit
  end

  # POST /ativos
  # POST /ativos.json
  def create
    @ativo = Ativo.new(ativo_params)

    respond_to do |format|
      if @ativo.save
        format.html { redirect_to @ativo, notice: "#{type} was successfully created." }
        format.json { render :show, status: :created, location: @ativo }
      else
        format.html { render :new }
        format.json { render json: @ativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ativos/1
  # PATCH/PUT /ativos/1.json
  def update
    respond_to do |format|
      if @ativo.update(ativo_params)
        format.html { redirect_to @ativo, notice: "#{type} was successfully updated." }
        format.json { render :show, status: :ok, location: @ativo }
      else
        format.html { render :edit }
        format.json { render json: @ativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ativos/1
  # DELETE /ativos/1.json
  def destroy
    @ativo.destroy
    respond_to do |format|
      format.html { redirect_to ativos_url, notice: "#{type} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_type
       @type = type 
    end

    def type 
        Ativo.types.include?(params[:type]) ? params[:type] : "Ativo"
    end

    def type_class 
        type.constantize 
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_ativo
      @ativo = type_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ativo_params
      params.require(type.underscore.to_sym).permit(:name, :curto_prazo, :type, :account_id, :longo_prazo, :investimento, :imobilizado, :intangivel, :natureza_conta)
    end
end
