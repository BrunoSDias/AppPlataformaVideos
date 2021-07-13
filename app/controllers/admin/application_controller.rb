class Admin::ApplicationController < ApplicationController
  layout "admin"

  before_action :authorize

  def authorize
    if cookies[:administrator].present?
      if Admin::Administrator.find(cookies[:administrator]).present?
        @administrator = cookies[:administrator]
        return
      end
    end
    redirect_to "/admin/login"
  end
end
