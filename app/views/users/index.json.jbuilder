json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :age, :gender
  json.url user_url(user)
end
