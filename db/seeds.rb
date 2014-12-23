User.delete_all
Vote.delete_all
Poll.delete_all
Voter.delete_all
Choice.delete_all

user = User.create!(first_name: 'Test', last_name: 'User', age: 99, gender: 'undecided')
poll = Poll.create!(title: 'Test poll', description: 'Test poll for Test User', status: 'new', creator_user_id: user.id)
Choice.create!(value: 'red', poll_id: poll.id)
Choice.create!(value: 'green', poll_id: poll.id)
Choice.create!(value: 'blue', poll_id: poll.id)
Voter.create!(poll_id: poll.id, user_id: user.id)
