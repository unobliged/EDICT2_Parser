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

ActiveRecord::Schema.define(:version => 20121025042325) do

  create_table "words", :force => true do |t|
    t.text         "keys"
    t.text         "kanji"
    t.text         "kana"
    t.text         "edict_id"
    t.datetime     "created_at", :null => false
    t.datetime     "updated_at", :null => false
    t.text         "keys_text"
    t.string_array "def_array"
    t.text         "def_text"
  end

  add_index "words", ["def_array"], :name => "gin_index_words_def_array"
  add_index "words", ["def_text"], :name => "trgm_gin_index_words_def_text"
  add_index "words", ["keys_text"], :name => "trgm_gin_index_words_keys_text"

end
