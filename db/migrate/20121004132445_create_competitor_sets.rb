class CreateCompetitorSets < ActiveRecord::Migration
  def change
    create_table :competitor_sets do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end

    rename_column :competitors, :competition_id, :competitor_set_id
  end
end
