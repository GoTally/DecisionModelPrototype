json.array!(@polls) do |poll|
  json.extract! poll, :id, :title, :description, :status, :expiration_date, :creator_user_id, :created_at, :updated_at
  json.url poll_url(poll)
end
