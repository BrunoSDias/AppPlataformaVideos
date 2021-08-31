class AddYoutubeVideoIdToSalesVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_videos, :youtube_video_id, :string
  end
end
