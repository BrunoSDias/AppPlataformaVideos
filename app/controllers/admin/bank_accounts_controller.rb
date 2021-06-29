class Admin::BankAccountsController < Admin::ApplicationController
  before_action :set_administrator
  before_action :set_admin_bank_account, only: %i[ show edit update destroy ]

  # GET /admin/bank_accounts or /admin/bank_accounts.json
  def index
    @admin_bank_accounts = Admin::BankAccount.all
  end

  # GET /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def show
  end

  # GET /admin/bank_accounts/new
  def new
    @admin_bank_account = Admin::BankAccount.new
  end

  # GET /admin/bank_accounts/1/edit
  def edit
  end

  # POST /admin/bank_accounts or /admin/bank_accounts.json
  def create
    @admin_bank_account = Admin::BankAccount.new(admin_bank_account_params)

    respond_to do |format|
      if @admin_bank_account.save
        format.html { redirect_to admin_administrator_bank_account_path(@administrator, @admin_bank_account), notice: "Bank account was successfully created." }
        format.json { render :show, status: :created, location: @admin_bank_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def update
    respond_to do |format|
      if @admin_bank_account.update(admin_bank_account_params)
        format.html { redirect_to @admin_bank_account, notice: "Bank account was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bank_accounts/1 or /admin/bank_accounts/1.json
  def destroy
    @admin_bank_account.destroy
    respond_to do |format|
      format.html { redirect_to admin_bank_accounts_url, notice: "Bank account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bank_account
      @admin_bank_account = Admin::BankAccount.find(params[:id])
    end

    def set_administrator
      @administrator = Admin::Administrator.find(params[:administrator_id])
    end

    # Only allow a list of trusted parameters through.
    def admin_bank_account_params
      params[:admin_bank_account][:admin_administrator_id] = params[:administrator_id]
      params.require(:admin_bank_account).permit(:numero, :agencia, :banco, :admin_administrator_id)
    end
end
