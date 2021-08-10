class Client::CoursesController < Client::ApplicationController
  before_action :set_client_course, only: [:show]

  def show
    @videos = Sales::Video.where(sales_course_id: @course.id)
  end

  private
  def set_client_course
    @course = Client::UsersCourse.find_by(sales_course_id: params[:course_id], client_user_id: @user)&.sales_course
  end
end
