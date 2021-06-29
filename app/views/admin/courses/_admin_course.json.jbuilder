json.extract! admin_course, :id, :nome, :descricao, :link, :created_at, :updated_at
json.url admin_course_url(admin_course, format: :json)
