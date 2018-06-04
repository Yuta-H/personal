json.extract! login_id, :id, :authenticate_key, :secret_id, :created_at, :updated_at
json.url login_id_url(login_id, format: :json)
