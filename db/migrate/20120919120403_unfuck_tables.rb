class UnfuckTables < ActiveRecord::Migration
  def change
    drop_table(:sessions)
    drop_table(:users)

    create_table "sessions" do |t|
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end

    create_table "users" do |t|
      t.string   "email"
      t.string   "name"
      t.string   "password_digest"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
      t.string   "auth_token"
    end
  end
end
