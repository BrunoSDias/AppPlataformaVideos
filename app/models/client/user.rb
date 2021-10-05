class Client::User < ApplicationRecord
  has_secure_password
  has_many :sales_orders, class_name: "Sales::Order", foreign_key: :client_user_id
  has_many :client_user_courses, class_name: "Client::UsersCourse", foreign_key: :client_user_id
  has_many :sales_courses, through: :client_user_courses
  has_many :client_user_videos, class_name: "Client::UserVideo", foreign_key: :client_user_id

  validates_presence_of :nome, :cpf, :email
  validates_uniqueness_of :cpf, :email

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
