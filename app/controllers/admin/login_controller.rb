class Admin::LoginController < Admin::ApplicationController
  layout "login"
  before_action :user_logged?
  skip_before_action :authorize

  def index
  end

  def signup
  end

  def sigin
    @administrator = Admin::Administrator.login(email: admin_administrator_params[:email], password: admin_administrator_params[:password])
    if @administrator.present?
      cookies[:administrator] = { value: @administrator.id, httponly: true }
      redirect_to admin_root_path
      return
    end
    flash[:error] = "Email ou senha incorretos"
    render :index
  end

  def create
    @administrator = Admin::Administrator.new(admin_administrator_params)
    if @administrator.save!
      cookies[:administrator] = { value: @administrator.id, httponly: true }
      redirect_to admin_root_path
      return
    end
    flash[:error] = "Houve um erro ao tentar realizar o cadastro, por favor tente novamente"
    render :signup
  end

  private

  def admin_administrator_params
    params.require(:admin_administrator).permit(:nome, :cpf, :telefone, :email, :password)
  end
  
  def user_logged?
    if cookies[:administrator].present?
      redirect_to admin_root_path if Admin::Administrator.find(cookies[:administrator]).present?
    end
  end
end
