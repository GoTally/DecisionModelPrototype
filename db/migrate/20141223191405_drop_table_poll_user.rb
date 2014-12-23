class DropTablePollUser < ActiveRecord::Migration
  def change
    drop_join_table :polls, :users
  end
end
