class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :competitions, [:user_id, :created_at]
  end
end
