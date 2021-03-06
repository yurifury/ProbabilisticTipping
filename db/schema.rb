# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121012153739) do

  create_table "competitions", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "finished",          :default => false
    t.integer  "competitor_set_id"
  end

  add_index "competitions", ["finished"], :name => "index_competitions_on_finished"
  add_index "competitions", ["user_id", "created_at"], :name => "index_competitions_on_user_id_and_created_at"

  create_table "competitor_sets", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "competitors", :force => true do |t|
    t.string   "name"
    t.integer  "competitor_set_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "round_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "competitor_1_id"
    t.integer  "competitor_2_id"
  end

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "competition_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "participations", ["user_id", "competition_id"], :name => "index_participations_on_user_id_and_competition_id"

  create_table "results", :force => true do |t|
    t.string   "winner"
    t.integer  "match_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.date     "closing_date"
    t.integer  "competition_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "results_entered", :default => false
  end

  create_table "sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tips", :force => true do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.integer  "probability"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "auth_token"
  end

end
