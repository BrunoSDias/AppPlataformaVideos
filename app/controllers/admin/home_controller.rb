class Admin::HomeController < Admin::ApplicationController
  def index
    @vendors = Sales::Seller
    .select("
      sales_sellers.id,
      sales_sellers.nome,
      (
        select sum(so1.valor_total) from sales_orders so1 
        inner join sales_courses sc1 on sc1.id = so1.sales_course_id
        where sc1.sales_seller_id = sales_sellers.id
      ) as total_bruto,
      (
        select sum(so2.taxa) from sales_orders so2 
        inner join sales_courses sc2 on sc2.id = so2.sales_course_id
        where sc2.sales_seller_id = sales_sellers.id
      ) as total_taxas,
      (
        select sum(so3.valor_liquido) from sales_orders so3 
        inner join sales_courses sc3 on sc3.id = so3.sales_course_id
        where sc3.sales_seller_id = sales_sellers.id
      ) as total_liquido
    ")

    @orders_total = Sales::Order.sum(:taxa)
    @orders_count = Sales::Order.count
  end
end
