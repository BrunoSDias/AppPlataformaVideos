class Sales::BankAccountsController < Sales::ApplicationController
  before_action :set_sales_bank_account, only: %i[ show edit update destroy ]

  # GET /sales/bank_accounts or /sales/bank_accounts.json
  def index
    @sales_bank_accounts = Sales::BankAccount.all
  end

  # GET /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def show
  end

  # GET /sales/bank_accounts/new
  def new
    @sales_bank_account = Sales::BankAccount.new
  end

  # GET /sales/bank_accounts/1/edit
  def edit
  end

  # POST /sales/bank_accounts or /sales/bank_accounts.json
  def create
    @sales_bank_account = Sales::BankAccount.new(sales_bank_account_params)

    respond_to do |format|
      if @sales_bank_account.save
        format.html { redirect_to @sales_bank_account, notice: "Conta Bancária adicionada com sucesso!" }
        format.json { render :show, status: :created, location: @sales_bank_account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def update
    respond_to do |format|
      if @sales_bank_account.update(sales_bank_account_params)
        format.html { redirect_to @sales_bank_account, notice: "Bank account was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/bank_accounts/1 or /sales/bank_accounts/1.json
  def destroy
    @sales_bank_account.destroy
    respond_to do |format|
      format.html { redirect_to sales_bank_accounts_url, notice: "Dados da conta atualizados com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_bank_account
      @sales_bank_account = Sales::BankAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_bank_account_params
      params.require(:sales_bank_account).permit(:conta, :agencia, :banco, :sales_seller_id)
    end
end
