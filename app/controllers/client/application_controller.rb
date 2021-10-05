class Client::ApplicationController < ApplicationController
  layout "client"

  before_action :authorize

  def authorize
    if cookies[:user].present?
      if params[:user_id].present?
        if params[:user_id] != cookies[:user]
          cookies[:user] = nil
          redirect_to "/login"
          return
        end
      end
      if Client::User.find(cookies[:user]).present?
        @user = cookies[:user]
        return
      end
    end
    redirect_to "/login"
  end
end
