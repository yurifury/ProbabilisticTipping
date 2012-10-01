class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :player1
      t.string :player2
      t.integer :round_id

      t.timestamps
    end
  end
end
