class Client::HomeController < Client::ApplicationController
  before_action :set_client_user, only: [:index]
  skip_before_action :authorize, only: :logout

  def index
    @courses = @client_user.courses
    .joins(:client_users_courses)
    .where(client_users_courses: { client_user_id: @user })
    .select("
      sales_courses.*,
      client_users_courses.concluido
    ")
  end

  def logout
    cookies[:user] = nil
    redirect_to '/'
  end

  private
  def set_client_user
    @client_user = Client::User.find(@user)
  end
end
