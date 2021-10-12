class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_host

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

  def set_host
    if Rails.env.production
      @host ||= "https://app-courses-platform.herokuapp.com/"
    else
      @host ||= "http://localhost:3000"
    end
  end
end
