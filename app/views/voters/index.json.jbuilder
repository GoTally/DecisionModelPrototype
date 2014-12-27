json.array!(@voters) do |voter|
  json.extract! voter, :id, :poll_id, :user_id
end
