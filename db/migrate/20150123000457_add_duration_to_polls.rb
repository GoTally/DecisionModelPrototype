class AddDurationToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :duration, :integer
  end
end
