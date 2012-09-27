class AddFinishedToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :finished, :boolean, default: false
    add_index :competitions, :finished
  end
end
