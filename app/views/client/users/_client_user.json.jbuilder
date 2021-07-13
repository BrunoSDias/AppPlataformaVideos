json.extract! client_user, :id, :nome, :telefone, :cpf, :email, :password_digest, :created_at, :updated_at
json.url client_user_url(client_user, format: :json)
