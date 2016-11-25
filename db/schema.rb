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

ActiveRecord::Schema.define(version: 20161125094617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "member_projects", force: :cascade do |t|
    t.integer "member_id"
    t.integer "project_id"
    t.index ["member_id"], name: "index_member_projects_on_member_id", using: :btree
    t.index ["project_id"], name: "index_member_projects_on_project_id", using: :btree
  end

  create_table "member_publications", force: :cascade do |t|
    t.integer "member_id"
    t.integer "publication_id"
    t.index ["member_id"], name: "index_member_publications_on_member_id", using: :btree
    t.index ["publication_id"], name: "index_member_publications_on_publication_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "member_pic_file_name"
    t.string   "member_pic_content_type"
    t.integer  "member_pic_file_size"
    t.datetime "member_pic_updated_at"
    t.text     "bio"
    t.string   "bibliography"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title"
    t.string   "slug"
    t.index ["slug"], name: "index_members_on_slug", unique: true, using: :btree
  end

  create_table "newsarticles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "newsarticle_pic_file_name"
    t.string   "newsarticle_pic_content_type"
    t.integer  "newsarticle_pic_file_size"
    t.datetime "newsarticle_pic_updated_at"
    t.string   "link"
    t.date     "date"
    t.string   "location"
    t.string   "newsarticle_doc_file_name"
    t.string   "newsarticle_doc_content_type"
    t.integer  "newsarticle_doc_file_size"
    t.datetime "newsarticle_doc_updated_at"
    t.string   "slug"
    t.index ["slug"], name: "index_newsarticles_on_slug", unique: true, using: :btree
  end

  create_table "project_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "contact"
    t.string   "email"
    t.string   "project_pic_file_name"
    t.string   "project_pic_content_type"
    t.integer  "project_pic_file_size"
    t.datetime "project_pic_updated_at"
    t.string   "link"
    t.string   "promotor"
    t.integer  "project_category_id"
    t.string   "slug"
    t.index ["project_category_id"], name: "index_projects_on_project_category_id", using: :btree
    t.index ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  end

  create_table "publication_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "year"
    t.string   "link"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "publication_category_id"
    t.string   "external_authors"
    t.integer  "pages"
    t.integer  "issue"
    t.integer  "volume"
    t.string   "journal"
    t.string   "congres"
    t.string   "location_congres"
    t.string   "slug"
    t.index ["publication_category_id"], name: "index_publications_on_publication_category_id", using: :btree
    t.index ["slug"], name: "index_publications_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "member_projects", "members"
  add_foreign_key "member_projects", "projects"
  add_foreign_key "projects", "project_categories"
  add_foreign_key "publications", "publication_categories"
end
