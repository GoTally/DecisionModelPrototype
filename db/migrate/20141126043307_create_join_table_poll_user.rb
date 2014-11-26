class CreateJoinTablePollUser < ActiveRecord::Migration
  def change
    create_join_table :polls, :users do |t|
      t.index :poll_id
      t.index :user_id
    end
  end
end
