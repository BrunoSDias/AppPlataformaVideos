class Sales::LoginController < Sales::ApplicationController
  layout "login"
  before_action :user_logged?
  skip_before_action :authorize

  def index
  end

  def signup
  end

  def sigin
    @seller = Sales::Seller.login(email: sales_seller_params[:email], password: sales_seller_params[:password])
    if @seller.present?
      cookies[:seller] = { value: @seller.id, httponly: true }
      redirect_to sales_root_path
      return
    end
    flash[:error] = "Email ou senha incorretos"
    render :index
  end

  def create
    @seller = Sales::Seller.new(sales_seller_params)
    if @seller.save!
      cookies[:seller] = { value: @seller.id, httponly: true }
      redirect_to sales_root_path
      return
    end
    flash[:error] = "Houve um erro ao tentar realizar o cadastro, por favor tente novamente"
    render :signup
  end

  private

  def sales_seller_params
    params.require(:sales_seller).permit(:nome, :cpf, :telefone, :email, :password)
  end
  
  def user_logged?
    if cookies[:seller].present?
      redirect_to sales_root_path if Sales::Seller.find(cookies[:seller]).present?
    end
  end
end
