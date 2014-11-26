class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :polls
  has_many :votes

  def full_name
    [first_name, last_name].join ' '
  end
end
