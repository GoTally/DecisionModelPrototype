class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  def full_name
    [first_name, last_name].join ' '
  end
end
