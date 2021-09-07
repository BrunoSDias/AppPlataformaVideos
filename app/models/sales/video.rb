class Sales::Video < ApplicationRecord
  belongs_to :sales_course, class_name: "Sales::Course"
  has_many :client_user_videos, class_name: "Client::UserVideo", foreign_key: :sales_video_id

  validates :nome, :descricao, :youtube_video_id, presence: true
end
