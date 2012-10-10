class AddResultsAddedToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :results_entered, :boolean, default: false
  end
end
