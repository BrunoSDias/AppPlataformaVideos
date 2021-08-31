namespace :lesson do
  task vinculate_user: :environment do
    Client::User.all.each do |user|
      Sales::Course.all.each do |course|
        lessons = course.sales_videos
        lessons.each do |lesson|
          Client::UserVideo.create(client_user_id: user.id, sales_video_id: lesson.id)
        end
      end
    end
  end
end
