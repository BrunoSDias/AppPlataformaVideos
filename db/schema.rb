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

ActiveRecord::Schema.define(version: 2021_07_13_012345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_administrators", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

  create_table "admin_categories", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_administrator_id"
    t.index ["admin_administrator_id"], name: "index_admin_categories_on_admin_administrator_id"
  end

  create_table "client_users", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_addresses", force: :cascade do |t|
    t.string "rua"
    t.integer "numero"
    t.string "estado"
    t.string "cep"
    t.string "bairro"
    t.bigint "sales_seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_seller_id"], name: "index_sales_addresses_on_sales_seller_id"
  end

  create_table "sales_bank_accounts", force: :cascade do |t|
    t.integer "conta"
    t.integer "agencia"
    t.integer "banco"
    t.bigint "sales_seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_seller_id"], name: "index_sales_bank_accounts_on_sales_seller_id"
  end

  create_table "sales_courses", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "link"
    t.bigint "sales_seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_category_id"
    t.index ["admin_category_id"], name: "index_sales_courses_on_admin_category_id"
    t.index ["sales_seller_id"], name: "index_sales_courses_on_sales_seller_id"
  end

  create_table "sales_sellers", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.bigint "telefone"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_videos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "link"
    t.bigint "sales_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_course_id"], name: "index_sales_videos_on_sales_course_id"
  end

  add_foreign_key "admin_categories", "admin_administrators"
  add_foreign_key "sales_addresses", "sales_sellers"
  add_foreign_key "sales_bank_accounts", "sales_sellers"
  add_foreign_key "sales_courses", "admin_categories"
  add_foreign_key "sales_videos", "sales_courses"
end
