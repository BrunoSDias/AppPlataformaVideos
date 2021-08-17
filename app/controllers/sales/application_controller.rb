class Sales::ApplicationController < ApplicationController
  layout "sales"

  before_action :authorize

  def authorize
    if cookies[:seller].present?
      if params[:seller_id].present?
        if params[:seller_id] != cookies[:seller]
          cookies[:seller] = nil
          redirect_to "/sales/login"
          return
        end
      elsif params[:id].present?
        if params[:id] != cookies[:seller]
          cookies[:seller] = nil
          redirect_to "/sales/login"
          return
        end
      end
      
      if Sales::Seller.find(cookies[:seller]).present?
        @seller = cookies[:seller]
        return
      end
    end
    redirect_to "/sales/login"
  end
end
