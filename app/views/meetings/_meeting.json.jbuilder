json.extract! meeting, :id, :name, :date, :s_time, :e_time, :user_id, :room_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
