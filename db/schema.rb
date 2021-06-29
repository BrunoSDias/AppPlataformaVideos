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

ActiveRecord::Schema.define(version: 2021_06_29_011648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_administrator_addresses", force: :cascade do |t|
    t.string "rua"
    t.integer "numero"
    t.string "bairro"
    t.integer "cep"
    t.string "estado"
    t.bigint "admin_administrators_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_administrators_id"], name: "index_admin_administrator_addresses_on_admin_administrators_id"
  end

  create_table "admin_administrators", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_bank_accounts", force: :cascade do |t|
    t.integer "numero"
    t.integer "agencia"
    t.integer "banco"
    t.bigint "admin_administrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_administrator_id"], name: "index_admin_bank_accounts_on_admin_administrator_id"
  end

  create_table "admin_courses", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_videos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "link"
    t.bigint "admin_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_course_id"], name: "index_admin_videos_on_admin_course_id"
  end

  add_foreign_key "admin_administrator_addresses", "admin_administrators", column: "admin_administrators_id"
  add_foreign_key "admin_videos", "admin_courses"
end
