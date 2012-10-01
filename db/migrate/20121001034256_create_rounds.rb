class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.datetime :closing_time
      t.integer :competition_id

      t.timestamps
    end
  end
end
