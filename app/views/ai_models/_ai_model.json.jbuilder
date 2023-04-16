json.extract! ai_model, :id, :file, :user_id, :description, :name, :score, :created_at, :updated_at
json.url ai_model_url(ai_model, format: :json)
json.file url_for(ai_model.file)
