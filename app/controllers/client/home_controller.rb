class Client::HomeController < Client::ApplicationController
  skip_before_action :authorize, only: :logout

  def index
  end

  def logout
    cookies[:user] = nil
    redirect_to '/'
  end
end
