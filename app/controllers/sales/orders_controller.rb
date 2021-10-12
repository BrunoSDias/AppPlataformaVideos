class Sales::OrdersController < ApplicationController
  def index
    @orders = Sales::Order
    .joins(:sales_course)
    .joins(:client_user)
    .where(sales_courses: { sales_seller_id: params[:sales_seller_id] })
    .select("
      sales_orders.id,
      sales_orders.tipo_pagamento,
      sales_orders.status,
      sales_orders.valor_total,
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
