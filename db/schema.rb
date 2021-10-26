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

ActiveRecord::Schema.define(version: 2021_10_26_004049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_administrators", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.index ["cpf"], name: "index_admin_administrators_on_cpf", unique: true
    t.index ["email"], name: "index_admin_administrators_on_email", unique: true
  end

  create_table "admin_categories", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_administrator_id"
    t.index ["admin_administrator_id"], name: "index_admin_categories_on_admin_administrator_id"
    t.index ["nome"], name: "index_admin_categories_on_nome", unique: true
  end

  create_table "client_user_videos", force: :cascade do |t|
    t.bigint "client_user_id"
    t.bigint "sales_video_id"
    t.boolean "concluido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_user_id"], name: "index_client_user_videos_on_client_user_id"
    t.index ["sales_video_id"], name: "index_client_user_videos_on_sales_video_id"
  end

  create_table "client_users", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_client_users_on_cpf", unique: true
    t.index ["email"], name: "index_client_users_on_email", unique: true
  end

  create_table "client_users_courses", force: :cascade do |t|
    t.bigint "client_user_id"
    t.bigint "sales_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "concluido", default: false
    t.index ["client_user_id"], name: "index_client_users_courses_on_client_user_id"
    t.index ["sales_course_id"], name: "index_client_users_courses_on_sales_course_id"
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
    t.index ["numero", "cep"], name: "index_sales_addresses_on_numero_and_cep", unique: true
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
    t.bigint "sales_seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_category_id"
    t.decimal "preco"
    t.index ["admin_category_id"], name: "index_sales_courses_on_admin_category_id"
    t.index ["sales_seller_id"], name: "index_sales_courses_on_sales_seller_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.bigint "client_user_id"
    t.bigint "sales_course_id"
    t.string "tipo_pagamento"
    t.decimal "valor_total"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "data_expiracao"
    t.string "payment_intent_id"
    t.string "pdf_boleto"
    t.string "numero_boleto"
    t.decimal "taxa"
    t.decimal "valor_liquido"
    t.index ["client_user_id"], name: "index_sales_orders_on_client_user_id"
    t.index ["sales_course_id"], name: "index_sales_orders_on_sales_course_id"
  end

  create_table "sales_sellers", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.bigint "telefone"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_account_id"
  end

  create_table "sales_videos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "link"
    t.bigint "sales_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "embed"
    t.string "youtube_video_id"
    t.index ["sales_course_id"], name: "index_sales_videos_on_sales_course_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_categories", "admin_administrators"
  add_foreign_key "client_user_videos", "client_users"
  add_foreign_key "client_user_videos", "sales_videos"
  add_foreign_key "client_users_courses", "client_users"
  add_foreign_key "client_users_courses", "sales_courses"
  add_foreign_key "sales_addresses", "sales_sellers"
  add_foreign_key "sales_bank_accounts", "sales_sellers"
  add_foreign_key "sales_courses", "admin_categories"
  add_foreign_key "sales_orders", "client_users"
  add_foreign_key "sales_orders", "sales_courses"
  add_foreign_key "sales_videos", "sales_courses"
end
