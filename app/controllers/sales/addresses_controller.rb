class Sales::AddressesController < Sales::ApplicationController
  before_action :set_sales_address, only: %i[ show edit update destroy ]

  # GET /sales/addresses or /sales/addresses.json
  def index
    @sales_addresses = Sales::Address.all
  end

  # GET /sales/addresses/1 or /sales/addresses/1.json
  def show
  end

  # GET /sales/addresses/new
  def new
    @sales_address = Sales::Address.new
  end

  # GET /sales/addresses/1/edit
  def edit
  end

  # POST /sales/addresses or /sales/addresses.json
  def create
    @sales_address = Sales::Address.new(sales_address_params)

    respond_to do |format|
      if @sales_address.save
        format.html { redirect_to @sales_address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @sales_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/addresses/1 or /sales/addresses/1.json
  def update
    respond_to do |format|
      if @sales_address.update(sales_address_params)
        format.html { redirect_to @sales_address, notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/addresses/1 or /sales/addresses/1.json
  def destroy
    @sales_address.destroy
    respond_to do |format|
      format.html { redirect_to sales_addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_address
      @sales_address = Sales::Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_address_params
      params.require(:sales_address).permit(:rua, :numero, :estado, :cep, :bairro, :sales_seller_id)
    end
end
