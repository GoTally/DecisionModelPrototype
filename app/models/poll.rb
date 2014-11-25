class Poll < ActiveRecord::Base
  validates_presence_of :creator_user_id, :title
end
