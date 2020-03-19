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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_055619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "builders", force: :cascade do |t|
    t.bigint "setup_id", null: false
    t.string "answer1"
    t.string "answer2"
    t.string "answer3"
    t.string "kudos"
    t.string "suggestions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setup_id"], name: "index_builders_on_setup_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "setup_id", null: false
    t.string "respondents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setup_id"], name: "index_participants_on_setup_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "setup_id", null: false
    t.string "frequency"
    t.string "day_of_week"
    t.string "day_of_month"
    t.string "reminder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day_of_bi_week"
    t.time "time_of_day"
    t.index ["setup_id"], name: "index_schedules_on_setup_id"
  end

  create_table "setups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "setup_name"
    t.string "icon"
    t.string "purpose"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_setups_on_user_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.string "team_name"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "builders", "setups"
  add_foreign_key "participants", "setups"
  add_foreign_key "schedules", "setups"
  add_foreign_key "setups", "users"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "users"
end
