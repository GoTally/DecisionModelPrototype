class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :choice_id
      t.integer :user_id
    end
    add_index :votes, :choice_id
    add_index :votes, :user_id
  end
end
