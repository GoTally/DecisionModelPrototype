json.array!(@votes) do |vote|
  json.extract! vote, :id, :choice_id, :user_id, :poll_id, :created_at, :updated_at
  json.url vote_url(vote)
end
