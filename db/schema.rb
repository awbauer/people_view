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

ActiveRecord::Schema.define(:version => 20130411220026) do

  create_table "credentials", :force => true do |t|
    t.integer  "nation_id"
    t.string   "token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "refresh_token"
    t.datetime "expires_at"
  end

  create_table "nations", :force => true do |t|
    t.string   "client_uid"
    t.string   "secret_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "url"
    t.string   "logo"
  end

  create_table "possible_responses", :force => true do |t|
    t.integer  "question_id"
    t.string   "name"
    t.string   "feedback"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "possible_responses", ["question_id"], :name => "index_possible_responses_on_question_id"

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "prompt"
    t.string   "kind"
    t.string   "slug"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "site_slug"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "nation_id"
  end

end
