json.extract! sales_seller, :id, :nome, :cpf, :telefone, :email, :password_digest, :created_at, :updated_at
json.url sales_seller_url(sales_seller, format: :json)
