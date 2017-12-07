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

ActiveRecord::Schema.define(version: 20171205201239) do

  create_table "episodes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "length"
    t.string "release_date"
    t.integer "podcast_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "mediacompanies", force: :cascade do |t|
    t.string "name"
  end

  create_table "podcastgenres", force: :cascade do |t|
    t.integer "podcast_id"
    t.integer "genre_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "name"
    t.float "rating"
    t.integer "mediacompany_id"
  end

end
