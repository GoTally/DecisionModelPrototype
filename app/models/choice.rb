class Choice < ActiveRecord::Base
  validates_presence_of :value
  has_many :votes
  belongs_to :poll
end
