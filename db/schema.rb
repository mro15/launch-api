# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_19_023145) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "launch_service_providers", force: :cascade do |t|
    t.integer "launch_service_provider_id"
    t.string "url"
    t.string "name"
    t.string "service_provider_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "launch_id"
    t.index ["launch_id"], name: "index_launch_service_providers_on_launch_id"
  end

  create_table "launch_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "launch_id"
    t.index ["launch_id"], name: "index_launch_statuses_on_launch_id"
  end

  create_table "launches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "url"
    t.integer "launch_library_id"
    t.string "slug"
    t.string "name"
    t.string "net"
    t.string "window_end"
    t.string "window_start"
    t.boolean "inhold"
    t.boolean "tbddate"
    t.boolean "tbdtime"
    t.float "probability"
    t.string "holdreason"
    t.string "failreason"
    t.string "hashtag"
    t.boolean "webcast_live"
    t.string "image"
    t.string "infographic"
    t.text "program"
    t.integer "status"
    t.datetime "imported_t"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.string "country_code"
    t.string "map_image"
    t.integer "total_launch_count"
    t.integer "total_landing_count"
    t.bigint "pad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pad_id"], name: "index_locations_on_pad_id"
  end

  create_table "missions", force: :cascade do |t|
    t.integer "launch_library_id"
    t.string "name"
    t.string "description"
    t.string "launch_designator"
    t.string "mission_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "launch_id"
    t.index ["launch_id"], name: "index_missions_on_launch_id"
  end

  create_table "orbits", force: :cascade do |t|
    t.integer "orbit_id"
    t.string "name"
    t.string "abbrev"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_orbits_on_mission_id"
  end

  create_table "pads", force: :cascade do |t|
    t.string "url"
    t.integer "agency_id"
    t.string "name"
    t.string "info_url"
    t.string "wiki_url"
    t.string "map_url"
    t.string "latitude"
    t.string "longitude"
    t.string "map_image"
    t.integer "total_launch_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "launch_id"
    t.index ["launch_id"], name: "index_pads_on_launch_id"
  end

  create_table "rocket_configurations", force: :cascade do |t|
    t.integer "launch_library_id"
    t.string "url"
    t.string "name"
    t.string "family"
    t.string "full_name"
    t.string "variant"
    t.bigint "rocket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rocket_id"], name: "index_rocket_configurations_on_rocket_id"
  end

  create_table "rockets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "launch_id"
    t.index ["launch_id"], name: "index_rockets_on_launch_id"
  end

  add_foreign_key "launch_service_providers", "launches"
  add_foreign_key "launch_statuses", "launches"
  add_foreign_key "locations", "pads"
  add_foreign_key "missions", "launches"
  add_foreign_key "orbits", "missions"
  add_foreign_key "pads", "launches"
  add_foreign_key "rocket_configurations", "rockets"
  add_foreign_key "rockets", "launches"
end
