class AddIndexForPollId < ActiveRecord::Migration
  def change
    add_index :choices, :poll_id
  end
end
