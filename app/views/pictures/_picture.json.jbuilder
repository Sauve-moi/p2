json.extract! picture, :id, :house_id, :picture_url, :created_at, :updated_at
json.url picture_url(picture, format: :json)
