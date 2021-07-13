class ApplicationController < ActionController::Base
  before_action :authorize

  def authorize
    if cookies[:user].present?
      if Client::User.find(cookies[:user]).present?
        @user = cookies[:user]
        redirect_to client_root_path
        return
      end
    end
    redirect_to root_path
  end
end
