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

ActiveRecord::Schema.define(:version => 20120621105348) do

  create_table "atividades", :force => true do |t|
    t.string   "name",       :limit => 20
    t.boolean  "disabled"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "bairros", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customer_pfs", :force => true do |t|
    t.string   "sexo",               :limit => 1
    t.integer  "empresa_id"
    t.string   "endereco_comercial", :limit => 120
    t.string   "setor",              :limit => 20
    t.string   "cargo",              :limit => 20
    t.string   "celular",            :limit => 15
    t.string   "formacao",           :limit => 20
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "customer_pjs", :force => true do |t|
    t.string   "fax",              :limit => 15
    t.integer  "qtd_funcionarios"
    t.integer  "segmento_id"
    t.integer  "atividade_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "customer_products", :force => true do |t|
    t.integer  "costumer_id"
    t.integer  "product_id"
    t.date     "date"
    t.boolean  "used",        :default => true
    t.integer  "rate_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name",            :limit => 60,                     :null => false
    t.string   "doc",             :limit => 14
    t.string   "doc_rg",          :limit => 22
    t.string   "nome_segundo",    :limit => 40
    t.string   "endereco",        :limit => 80
    t.integer  "bairro_id"
    t.integer  "city_id"
    t.string   "estado",          :limit => 2
    t.string   "cep",             :limit => 8
    t.string   "obs",             :limit => 500
    t.date     "data_nascimento"
    t.string   "fone",            :limit => 15
    t.string   "rede_social",     :limit => 200
    t.string   "site",            :limit => 200
    t.boolean  "cliente",                        :default => false
    t.boolean  "pj",                             :default => true
    t.integer  "parent_id"
    t.boolean  "disabled"
    t.integer  "person_id"
    t.string   "person_type"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "emails", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "history_pfs", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "comercial"
    t.string   "receber_infos", :default => "t"
    t.string   "pessoal",       :default => "t"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "seguimentos", :force => true do |t|
    t.string   "name",       :limit => 20
    t.boolean  "disabled"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 25
    t.string   "email",           :limit => 100
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
