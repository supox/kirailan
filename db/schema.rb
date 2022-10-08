# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2014_08_24_201459) do

  create_table "approvals", force: :cascade do |t|
    t.string "name"
    t.integer "guests"
    t.string "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hitchhikes", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "from"
    t.string "hour"
    t.string "comments"
    t.boolean "taking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "artist"
    t.integer "song_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transports", force: :cascade do |t|
    t.string "name"
    t.integer "direction"
    t.string "comments"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishes", force: :cascade do |t|
    t.string "content"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
