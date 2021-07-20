class Marketplace::CoursesController < Marketplace::ApplicationController
  def show
    @course = Sales::Course.find(params[:id])
  end
end
