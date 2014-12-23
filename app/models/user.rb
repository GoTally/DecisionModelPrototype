class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_many :votes

  has_many :voters
  has_many :polls, through: :voters

  def full_name
    [first_name, last_name].join ' '
  end
end
