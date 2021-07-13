class HomeController < ApplicationController
  skip_before_action :authorize
  before_action :user_logged?

  def index
  end
  
  def user_logged?
    if cookies[:user].present?
      redirect_to client_root_path if Client::User.find(cookies[:user]).present?
    end
  end
end
