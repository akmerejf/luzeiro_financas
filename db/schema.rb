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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170503025509) do

  create_table "accounts", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.boolean  "analytic",                  default: false, null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "ancestry",    limit: 255
    t.integer  "company_id",  limit: 4
  end

  add_index "accounts", ["ancestry"], name: "index_accounts_on_ancestry", using: :btree
  add_index "accounts", ["company_id"], name: "index_accounts_on_company_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "cep",        limit: 255
    t.string   "number",     limit: 255
    t.string   "street",     limit: 255
    t.string   "district",   limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "city",       limit: 255
  end

  add_index "addresses", ["company_id"], name: "index_addresses_on_company_id", using: :btree

  create_table "ativos", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.boolean  "curto_prazo"
    t.boolean  "longo_prazo"
    t.boolean  "investimento"
    t.boolean  "imobilizado"
    t.boolean  "intangivel"
    t.string   "natureza_conta", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "account_id",     limit: 4
    t.string   "type",           limit: 255
  end

  add_index "ativos", ["account_id"], name: "index_ativos_on_account_id", using: :btree

  create_table "balances", force: :cascade do |t|
    t.decimal  "value",                  precision: 10, scale: 2
    t.integer  "nature",       limit: 4
    t.integer  "account_id",   limit: 4
    t.integer  "operation_id", limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "balances", ["account_id"], name: "index_balances_on_account_id", using: :btree
  add_index "balances", ["operation_id"], name: "index_balances_on_operation_id", using: :btree

  create_table "caixas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "chart_of_accounts", ["company_id"], name: "index_chart_of_accounts_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "cnpj",                   limit: 255
    t.integer  "user_id",                limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "fantasy_name",           limit: 255
    t.string   "social_denomination",    limit: 255
    t.string   "phone",                  limit: 255
    t.string   "state_insc",             limit: 255
    t.string   "local_insc",             limit: 255
    t.string   "suprama",                limit: 255
    t.string   "nire",                   limit: 255
    t.date     "started_at"
    t.string   "company",                limit: 255
    t.string   "situation",              limit: 255
    t.datetime "last_update"
    t.string   "status",                 limit: 255
    t.string   "tipo",                   limit: 255
    t.string   "email",                  limit: 255
    t.string   "efr",                    limit: 255
    t.string   "motive_situation",       limit: 255
    t.string   "special_situation",      limit: 255
    t.date     "special_situation_date"
    t.string   "capital",                limit: 255
    t.date     "situation_date"
    t.string   "taxation",               limit: 255
    t.string   "operation_nature",       limit: 255
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "main_activities", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "code",        limit: 255
    t.integer  "company_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "main_activities", ["company_id"], name: "index_main_activities_on_company_id", using: :btree

  create_table "operations", force: :cascade do |t|
    t.decimal  "value",                           precision: 10, scale: 2
    t.string   "description",         limit: 255
    t.integer  "release_account_id",  limit: 4
    t.integer  "retrieve_account_id", limit: 4
    t.date     "operation_date"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "operations", ["release_account_id"], name: "index_operations_on_release_account_id", using: :btree
  add_index "operations", ["retrieve_account_id"], name: "index_operations_on_retrieve_account_id", using: :btree

  create_table "qsas", force: :cascade do |t|
    t.string   "which",      limit: 255
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "qsas", ["company_id"], name: "index_qsas_on_company_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "code",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sencondary_activities", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "code",        limit: 255
    t.integer  "company_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sencondary_activities", ["company_id"], name: "index_sencondary_activities_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role_id",                limit: 4
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "accounts", "companies"
  add_foreign_key "addresses", "companies"
  add_foreign_key "ativos", "accounts"
  add_foreign_key "balances", "accounts"
  add_foreign_key "balances", "operations"
  add_foreign_key "chart_of_accounts", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "main_activities", "companies"
  add_foreign_key "qsas", "companies"
  add_foreign_key "sencondary_activities", "companies"
  add_foreign_key "users", "roles"
end
