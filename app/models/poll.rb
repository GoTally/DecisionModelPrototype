class Poll < ActiveRecord::Base
  validates_presence_of :creator_user_id, :title
  has_and_belongs_to_many :users
end
