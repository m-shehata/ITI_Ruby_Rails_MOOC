json.extract! user, :id, :name, :date_of_birth, :gender, :role, :attachment, :created_at, :updated_at
json.url user_url(user, format: :json)
