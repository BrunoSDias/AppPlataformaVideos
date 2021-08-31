class CreateClientUserVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :client_user_videos do |t|
      t.references :client_user, foreign_key: true
      t.references :sales_video, foreign_key: true
      t.boolean :concluido

      t.timestamps
    end
  end
end
