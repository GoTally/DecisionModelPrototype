return {error: 'not-found'}.to_json unless @user
json.extract! @user, :id, :first_name, :last_name, :age, :gender
json.polls @user.polls, :id, :title, :description, :status, :expiration_date, :creator_user_id if params[:polls]
json.url user_url(@user)
