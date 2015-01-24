return {error: 'not-found'}.to_json unless @choice
json.extract! @choice, :id, :value, :poll_id, :votes_count, :created_at, :updated_at
json.url choice_url(@choice, format: :json)
