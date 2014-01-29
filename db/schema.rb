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

ActiveRecord::Schema.define(version: 20140126194249) do

  create_table "efforts", force: true do |t|
    t.integer  "work_id"
    t.integer  "method"
    t.string   "name"
    t.float    "estimation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "efforts", ["work_id"], name: "index_efforts_on_work_id"

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "ancestry_depth", default: 0
  end

  add_index "products", ["project_id"], name: "index_products_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "estimation_method", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_allocations", force: true do |t|
    t.integer "work_id"
    t.integer "resource_id"
    t.float   "amount"
  end

  create_table "resources", force: true do |t|
    t.string   "name"
    t.integer  "group"
    t.string   "qualification"
    t.string   "experience"
    t.float    "fte"
    t.integer  "position"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["project_id"], name: "index_resources_on_project_id"

  create_table "works", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "parent_id"
    t.integer  "output_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "ancestry_depth", default: 0
  end

  add_index "works", ["output_id"], name: "index_works_on_output_id"
  add_index "works", ["project_id"], name: "index_works_on_project_id"

end
