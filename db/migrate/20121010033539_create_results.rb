class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :winner
      t.integer :match_id

      t.timestamps
    end
  end
end
