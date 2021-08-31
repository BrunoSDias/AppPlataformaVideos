class Client::VideosController < Client::ApplicationController
  def show
    @video = Sales::Video.find(params[:id])
    render json: @video, status: :ok
  end

  def conclude_lesson
    user_lesson = Client::UserVideo.find_by(client_user_id: @user, sales_video_id: params[:id])
    if user_lesson.update(concluido: true)
      lessons = Sales::Course.find(params[:course_id]).sales_videos.pluck(:id)
      next_lesson = begin
        Client::UserVideo
        .where(client_user_id: @user, sales_video_id: lessons, concluido: [false, nil])
        .where("client_user_videos.id > #{user_lesson.id}")
        .limit(1)
        .reorder(id: :asc)
        .first
      rescue => err
        puts "===================================================="
        puts "===================================================="
        puts err
        puts "===================================================="
        puts "===================================================="
        nil
      end

      render json: {next_lesson: next_lesson}, status: :ok
      return
    end
    render json: {}, status: :unauthorized
  end
end
