json.extract! password, :id, :password, :user_id, :secret_id, :created_at, :updated_at
json.url password_url(password, format: :json)
