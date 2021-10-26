class Marketplace::HomeController < Marketplace::ApplicationController
  def index
    client = Client::User.find(cookies[:user]) if cookies[:user]
    sales_courses_ids = client&.sales_courses&.pluck(:id)
    if sales_courses_ids && sales_courses_ids.present?
      @courses = Sales::Course.where.not(id: sales_courses_ids)
    else
      @courses = Sales::Course.all
    end
  end
end
