class Client::VideosController < Client::ApplicationController
  def show
    @video = Sales::Video.find(params[:id])
    render json: @video, status: :ok
  end

  def conclude_lesson
    user_lesson = Client::UserVideo.find_by(client_user_id: @user, sales_video_id: params[:id])
    if user_lesson.update(concluido: true)
      next_lesson, percentage = user_lesson.next_lesson(user_id: @user, course_id: params[:course_id])
      if next_lesson
        render json: {next_lesson: next_lesson, concluded: false, percentage: percentage}, status: :ok
      else
        Client::UsersCourse.find_by(sales_course_id: params[:course_id], client_user_id: @user).update(concluido: true)
        render json: {next_lesson: next_lesson, concluded: true, percentage: percentage}, status: :ok
      end
      return
    end
    render json: {}, status: :unauthorized
  end
end
