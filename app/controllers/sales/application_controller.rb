class Sales::ApplicationController < ApplicationController
  layout "sales"

  before_action :authorize

  def authorize
    if cookies[:seller].present?
      if Sales::Seller.find(cookies[:seller]).present?
        @seller = cookies[:seller]
        return
      end
    end
    redirect_to "/sales/login"
  end

end
