return {error: 'not-found'}.to_json unless @voter
json.extract! @voter, :id, :poll_id, :user_id
