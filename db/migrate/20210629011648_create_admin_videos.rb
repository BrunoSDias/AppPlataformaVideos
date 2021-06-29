class CreateAdminVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_videos do |t|
      t.string :nome
      t.text :descricao
      t.string :link
      t.references :admin_course, foreign_key: true

      t.timestamps
    end
  end
end
