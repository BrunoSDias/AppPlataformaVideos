class Sales::Video < ApplicationRecord
  belongs_to :sales_course, class_name: "Sales::Course"
  has_many :client_user_videos, class_name: "Client::UserVideo", foreign_key: :sales_course_id

  validates :nome, :descricao, :youtube_video_id, presence: true

  def concluded?(user_id)
    Client::UserVideo.find_by(client_user_id: user_id, sales_video_id: id, concluido: true) ? true : false
  end
end
