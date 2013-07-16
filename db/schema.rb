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

ActiveRecord::Schema.define(:version => 20120907141742) do

  create_table "argumentaires", :force => true do |t|
    t.integer  "main_argument_id"
    t.integer  "aux_argument_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arguments", :force => true do |t|
    t.string   "name"
    t.string   "nature"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "arguments", ["slug"], :name => "index_arguments_on_slug", :unique => true

  create_table "articles", :force => true do |t|
    t.text     "titre"
    t.integer  "revue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contenu"
    t.boolean  "fiche_technique"
    t.integer  "position"
    t.integer  "authorships_count", :default => 0
  end

  create_table "articles_categories", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "categorie_id"
  end

  create_table "authors", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "authorships_count", :default => 0
    t.string   "slug"
  end

  add_index "authors", ["slug"], :name => "index_authors_on_slug", :unique => true

  create_table "authorships", :force => true do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "editorials", :force => true do |t|
    t.text     "titre"
    t.text     "contenu"
    t.integer  "author_id"
    t.integer  "revue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redactionships", :force => true do |t|
    t.integer "revue_id"
    t.integer "author_id"
  end

  create_table "revues", :force => true do |t|
    t.integer  "numero"
    t.date     "date_sortie"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "articles_count", :default => 0
    t.string   "pdf_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
