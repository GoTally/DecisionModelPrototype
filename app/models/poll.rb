class Poll < ActiveRecord::Base
  validates_presence_of :creator_user_id, :title
  has_many :choices

  has_many :voters
  has_many :users, through: :voters
end
