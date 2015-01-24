class AddVotesCountToChoices < ActiveRecord::Migration
  def up
    add_column :choices, :votes_count, :integer, default: 0

    Choice.pluck(:id).each do |id|
      Choice.reset_counters(id, :votes)
    end
  end

  def down
    remove_column :choices, :votes_count
  end
end
