json.extract! room, :id, :name, :capacity, :meeting_id, :created_at, :updated_at
json.url room_url(room, format: :json)
