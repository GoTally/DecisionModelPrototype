class Choice < ActiveRecord::Base
  validates_presence_of :value
  belongs_to :poll
end
