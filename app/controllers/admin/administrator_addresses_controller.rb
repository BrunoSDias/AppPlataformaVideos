class Admin::AdministratorAddressesController < Admin::ApplicationController
  before_action :set_administrator
  before_action :set_admin_administrator_address, only: %i[ show edit update destroy ]

  # GET /admin/administrator_addresses or /admin/administrator_addresses.json
  def index
    @admin_administrator_addresses = Admin::AdministratorAddress.all
  end

  # GET /admin/administrator_addresses/1 or /admin/administrator_addresses/1.json
  def show
  end

  # GET /admin/administrator_addresses/new
  def new
    @admin_administrator_address = Admin::AdministratorAddress.new
  end

  # GET /admin/administrator_addresses/1/edit
  def edit
  end

  # POST /admin/administrator_addresses or /admin/administrator_addresses.json
  def create
    @admin_administrator_address = Admin::AdministratorAddress.new(admin_administrator_address_params)

    respond_to do |format|
      if @admin_administrator_address.save
        format.html { redirect_to @admin_administrator_address, notice: "Administrator address was successfully created." }
        format.json { render :show, status: :created, location: @admin_administrator_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_administrator_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/administrator_addresses/1 or /admin/administrator_addresses/1.json
  def update
    respond_to do |format|
      if @admin_administrator_address.update(admin_administrator_address_params)
        format.html { redirect_to @admin_administrator_address, notice: "Administrator address was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_administrator_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_administrator_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/administrator_addresses/1 or /admin/administrator_addresses/1.json
  def destroy
    @admin_administrator_address.destroy
    respond_to do |format|
      format.html { redirect_to admin_administrator_addresses_url, notice: "Administrator address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_administrator_address
      @admin_administrator_address = Admin::AdministratorAddress.find(params[:id])
    end

    def set_administrator
      @administrator = Admin::Administrator.find(params[:administrator_id])
    end

    # Only allow a list of trusted parameters through.
    def admin_administrator_address_params
      params[:admin_administrator_address][:admin_administrators_id] = params[:administrator_id]
      params.require(:admin_administrator_address).permit(:rua, :numero, :bairro, :cep, :bairro, :estado, :admin_administrators_id)
    end
end
