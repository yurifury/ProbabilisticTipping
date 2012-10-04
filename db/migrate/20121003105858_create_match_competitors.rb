class CreateMatchCompetitors < ActiveRecord::Migration
  def change
    create_table :match_competitors do |t|
      t.integer :match_id
      t.integer :competitor_id

      t.timestamps
    end
  end
end
