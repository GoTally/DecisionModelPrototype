class CreatePoll < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.string :description
      t.string :status
      t.string :type
      t.datetime :expiration_date
      t.integer :creator_user_id

      t.timestamps
    end

    add_index :polls, :creator_user_id
    add_index :polls, :type
  end
end
