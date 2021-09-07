class Client::CoursesController < Client::ApplicationController
  before_action :set_client_course, only: [:show]

  def show
    @videos = Sales::Video.joins(:client_user_videos)
    .where(sales_videos: { sales_course_id: @course.id }, client_user_videos: { client_user_id: @user })
    .select("
      sales_videos.id,
      sales_videos.nome,
      sales_videos.youtube_video_id,
      client_user_videos.concluido
    ")
    .distinct

    total_videos = @videos.size
    @percentage = (@videos.where(client_user_videos: { concluido: true }).size / total_videos.to_f * 100).round rescue 0
  end

  private
  def set_client_course
    @course = Client::UsersCourse.find_by(sales_course_id: params[:course_id], client_user_id: @user)&.sales_course
  end
end
