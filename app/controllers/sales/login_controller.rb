class Sales::LoginController < Sales::ApplicationController
  layout "login"
  before_action :user_logged?, except: [:logout, :create]
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

  def retry_stripe
    account = Stripe::Account.create({
      type: 'express',
    })

    account_links = Stripe::AccountLink.create({
      account: account.id,
      refresh_url: 'http://localhost:3000/sales/retry_stripe',
      return_url: 'http://localhost:3000/sales',
      type: 'account_onboarding',
    })
    
    if account_links.url
      Sales::Seller.find(cookies[:seller]).update(stripe_account_id: account.id)

      redirect_to account_links.url
    end
  end

  def create
    @seller = Sales::Seller.new(sales_seller_params)
    if @seller.save!
      cookies[:seller] = { value: @seller.id, httponly: true }

      account = Stripe::Account.create({
        type: 'express',
      })

      account_links = Stripe::AccountLink.create({
        account: account.id,
        refresh_url: 'http://localhost:3000/sales/retry_stripe',
        return_url: 'http://localhost:3000/sales',
        type: 'account_onboarding',
      })

      if account_links.url
        @seller.update(stripe_account_id: account.id)
        redirect_to account_links.url
      end
      return
    end
    flash[:error] = "Houve um erro ao tentar realizar o cadastro, por favor tente novamente"
    render :signup
  end

  def logout
    cookies[:seller] = nil
    redirect_to "/sales/login"
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
