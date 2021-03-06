return {error: 'not-found'}.to_json unless @poll
json.extract! @poll, :id, :title, :description, :status, :duration, :creator_user_id, :created_at, :updated_at
json.choices @poll.choices, :id, :value, :poll_id if params[:choices]
json.invitees @poll.users, :id, :first_name, :last_name, :age, :gender if params[:invitees]
json.url poll_url(@poll)
