class Client::VideosController < Client::ApplicationController
  def show
    @video = Sales::Video.find(params[:id])
    render json: @video, status: :ok
  end
end
