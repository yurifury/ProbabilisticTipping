class UndoMatchCompetitors < ActiveRecord::Migration
  def change
    drop_table :match_competitors

    remove_column(:matches, :player1, :player2)

    add_column(:matches, :competitor_1_id, :integer)
    add_column(:matches, :competitor_2_id, :integer)
  end
end
