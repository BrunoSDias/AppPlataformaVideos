class Client::User < ApplicationRecord
  has_secure_password
  has_many :client_user_courses, class_name: "Client::UsersCourse", foreign_key: :client_user_id
  has_many :sales_courses, through: :client_user_courses

  def self.login(email:, password:)
    user = find_by(email: email)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

  def courses
    sales_courses.joins(:sales_videos).distinct
  end
end
