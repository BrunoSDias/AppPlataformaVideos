class Client::HomeController < Client::ApplicationController
  before_action :set_client_user, only: [:index]
  skip_before_action :authorize, only: :logout

  def index
    @courses = @client_user.courses
  end

  def logout
    cookies[:user] = nil
    redirect_to '/'
  end

  private
  def set_client_user
    @client_user = Client::User.find(@user)
  end
end
