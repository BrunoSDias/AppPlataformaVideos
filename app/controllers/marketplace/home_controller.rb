class Marketplace::HomeController < Marketplace::ApplicationController
  def index
    @courses = Sales::Course.all
  end
end
