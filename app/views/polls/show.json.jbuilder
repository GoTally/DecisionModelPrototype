return {error: 'not-found'}.to_json unless @poll
json.extract! @poll, :id, :title, :description, :status, :expiration_date, :creator_user_id, :created_at, :updated_at
json.choices @poll.choices, :id, :value, :poll_id if params[:choices]
json.url poll_url(@poll)
