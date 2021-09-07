class Client::UserVideo < ApplicationRecord
  belongs_to :client_user, class_name: "Client::User"
  belongs_to :sales_video, class_name: "Sales::Video"

  def next_lesson(user_id:, course_id:)
    total_videos = Sales::Course.find(course_id).sales_videos.pluck(:id)

    total_not_concluded = Client::UserVideo
    .where(client_user_id: user_id, sales_video_id: total_videos, concluido: [false, nil])
    .reorder(id: :asc) rescue [] if total_not_concluded.blank?

    percentage = 100 - (total_not_concluded.size / total_videos.size.to_f * 100).round rescue 0

    next_lesson = total_not_concluded.where("client_user_videos.id > #{id}").first
    next_lesson = total_not_concluded.first if next_lesson.blank?

    [next_lesson, percentage]
  end
end
