class Client::ApplicationController < ApplicationController
  layout "client"

  before_action :authorize

  def authorize
    if cookies[:user].present?
      if Client::User.find(cookies[:user]).present?
        @user = cookies[:user]
        return
      end
    end
    redirect_to "/"
  end
end
