class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.string :name
      t.integer :competition_id

      t.timestamps
    end
  end
end
