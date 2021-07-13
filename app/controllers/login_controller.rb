class LoginController < ApplicationController
  layout "application"
  skip_before_action :authorize
  before_action :user_logged?

  def index
  end

  def signup
  end

  def sigin
    @user = Client::User.login(email: user_params[:email], password: user_params[:password])
    if @user.present?
      cookies[:user] = { value: @user.id, httponly: true }
      redirect_to root_path
      return
    end
    flash[:error] = "Email ou senha incorretos"
    render :index
  end

  def create
    @user = Client::User.new(user_params)
    if @user.save!
      cookies[:user] = { value: @user.id, httponly: true }
      redirect_to root_path
      return
    end
    flash[:error] = "Houve um erro ao tentar realizar o cadastro, por favor tente novamente"
    render :signup
  end

  private

  def user_params
    params.require(:user).permit(:nome, :cpf, :telefone, :email, :password)
  end
  
  def user_logged?
    if cookies[:user].present?
      redirect_to root_path if Client::User.find(cookies[:user]).present?
    end
  end
end
