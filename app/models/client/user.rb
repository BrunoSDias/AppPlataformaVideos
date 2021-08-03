class Client::User < ApplicationRecord
  has_secure_password
  has_many :client_user_courses, class_name: "Client::UsersCourse"

  def self.login(email:, password:)
    user = find_by(email: email)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

  def courses
    Sales::Course.where(id: Client::UsersCourse.where(client_user_id: id).pluck(:sales_course_id))
  end
end
