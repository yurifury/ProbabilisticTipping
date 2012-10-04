class AddCompetitorSetIdToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :competitor_set_id, :integer
  end
end
