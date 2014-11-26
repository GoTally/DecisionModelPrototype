class Choice < ActiveRecord::Base
  validates_presence_of :value, :poll_id
  has_many :votes
  belongs_to :poll
end
