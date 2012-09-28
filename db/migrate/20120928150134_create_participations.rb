class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :competition_id

      t.timestamps
    end
    add_index :participations, [:user_id, :competition_id]
  end
end
