class Sales::YoutubeController < Sales::ApplicationController
  skip_before_action :authorize

  def redirect
  end

  def upload
    path = params[:video].path
    response = VideoService.upload(path: path, title: params[:title], token: params[:token])
    render json: {embed: response.embed_html }, status: :ok
  rescue => err
    puts err
  end
end
