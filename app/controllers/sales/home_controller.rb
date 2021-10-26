class Sales::HomeController < Sales::ApplicationController
  def index
    seller = Sales::Seller.find(@seller)

    if seller.stripe_account_id.blank?
      if seller.destroy
        cookies[:seller] = nil
        redirect_to '/sales/signup'
        return
      end
    end

    @orders = Sales::Order
    .joins(:sales_course)
    .joins(:client_user)
    .where(sales_courses: { sales_seller_id: @seller })
    .select("
      sales_orders.id,
      sales_orders.tipo_pagamento,
      sales_orders.status,
      sales_orders.valor_total,
      sales_orders.valor_liquido,
      sales_orders.taxa,
      sales_orders.data_expiracao,
      sales_orders.pdf_boleto,
      sales_courses.id as sales_course_id,
      sales_courses.nome,
      client_users.nome as client_user_nome,
      client_users.telefone,
      client_users.email
    ")
    .distinct
  end
end
