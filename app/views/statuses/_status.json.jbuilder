json.extract! status, :id, :name, :task_id, :trouble_id, :created_at, :updated_at
json.url status_url(status, format: :json)
