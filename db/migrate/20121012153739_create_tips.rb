class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :probability

      t.timestamps
    end
  end
end
