class Sales::SellersController < Sales::ApplicationController
  before_action :set_sales_seller, only: %i[ show edit update destroy ]

  # GET /sales/sellers or /sales/sellers.json
  def index
    @sales_sellers = Sales::Seller.all
  end

  # GET /sales/sellers/1 or /sales/sellers/1.json
  def show
  end

  # GET /sales/sellers/new
  def new
    @sales_seller = Sales::Seller.new
  end

  # GET /sales/sellers/1/edit
  def edit
  end

  # POST /sales/sellers or /sales/sellers.json
  def create
    @sales_seller = Sales::Seller.new(sales_seller_params)

    respond_to do |format|
      if @sales_seller.save
        format.html { redirect_to @sales_seller, notice: "Seller was successfully created." }
        format.json { render :show, status: :created, location: @sales_seller }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/sellers/1 or /sales/sellers/1.json
  def update
    respond_to do |format|
      if @sales_seller.update(sales_seller_params)
        format.html { redirect_to @sales_seller, notice: "Seller was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_seller }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/sellers/1 or /sales/sellers/1.json
  def destroy
    @sales_seller.destroy
    respond_to do |format|
      format.html { redirect_to sales_sellers_url, notice: "Seller was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_seller
      @sales_seller = Sales::Seller.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_seller_params
      params.require(:sales_seller).permit(:nome, :cpf, :telefone, :email, :password_digest)
    end
end
