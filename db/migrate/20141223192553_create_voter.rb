class CreateVoter < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :poll_id
      t.integer :user_id
    end
  end
end
