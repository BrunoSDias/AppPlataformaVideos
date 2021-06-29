json.extract! admin_video, :id, :nome, :descricao, :link, :admin_curso_id, :created_at, :updated_at
json.url admin_video_url(admin_video, format: :json)
