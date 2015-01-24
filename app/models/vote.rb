class Vote < ActiveRecord::Base
  belongs_to :choice, counter_cache: true
  belongs_to :user
end
