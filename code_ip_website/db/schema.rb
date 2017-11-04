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

ActiveRecord::Schema.define(version: 20171024134530) do

  create_table "etudiants", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.date "date_naissance"
    t.integer "master_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_etudiants_on_master_id"
  end

  create_table "masters", force: :cascade do |t|
    t.string "nom"
    t.string "responsable"
    t.integer "effectif_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
