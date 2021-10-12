class Sales::Order < ApplicationRecord
  belongs_to :client_user, class_name: "Client::User", foreign_key: :client_user_id
  belongs_to :sales_course, class_name: "Sales::Course", foreign_key: :sales_course_id

  enum status: { aguardando: 1, pago: 2 }

  after_commit :create_users_course

  def create_users_course
    return if Client::UsersCourse.find_by(client_user_id: client_user_id, sales_course_id: sales_course_id)
    return unless self.status == "pago"
    
    course = self.sales_course
    if Client::UsersCourse.create(client_user_id: client_user_id, sales_course_id: course.id)
      course.sales_videos.each do |video|
        Client::UserVideo.create(client_user_id: client_user_id, sales_video_id: video.id)
      end
    end
  end
end
