class RemoveExpirationDateFromPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :expiration_date, :datetime
  end
end
