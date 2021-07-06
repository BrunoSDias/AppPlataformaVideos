json.extract! sales_course, :id, :nome, :descricao, :link, :sales_seller, :created_at, :updated_at
json.url sales_course_url(sales_course, format: :json)
