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

ActiveRecord::Schema.define(version: 20170517155310) do

  create_table "abilities", force: :cascade do |t|
    t.string  "ability_type"
    t.integer "value"
    t.float   "score"
    t.integer "character_stat_id"
    t.index ["character_stat_id"], name: "index_abilities_on_character_stat_id"
  end

  create_table "ability_items", force: :cascade do |t|
    t.string  "name"
    t.boolean "proficiency"
    t.boolean "expertize"
    t.integer "ability_id"
    t.index ["ability_id"], name: "index_ability_items_on_ability_id"
  end

  create_table "actions", force: :cascade do |t|
    t.string  "name"
    t.string  "damage_dice"
    t.integer "damage_bonus"
    t.integer "range"
    t.string  "damage_type"
    t.integer "character_id"
    t.index ["character_id"], name: "index_actions_on_character_id"
  end

  create_table "backgrounds", force: :cascade do |t|
    t.string "name"
    t.string "skill_proficiency_1"
    t.string "skill_proficiency_2"
  end

  create_table "character_classes", force: :cascade do |t|
    t.integer "level"
    t.integer "klass_id"
    t.integer "character_id"
    t.index ["character_id"], name: "index_character_classes_on_character_id"
    t.index ["klass_id"], name: "index_character_classes_on_klass_id"
  end

  create_table "character_stats", force: :cascade do |t|
    t.integer "character_id"
    t.index ["character_id"], name: "index_character_stats_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string  "character_type"
    t.string  "name"
    t.string  "alignment"
    t.string  "description"
    t.string  "speed"
    t.integer "armor_class"
    t.integer "base_armor_class"
    t.integer "hit_points"
    t.integer "race_id"
    t.integer "sense_id"
    t.integer "background_id"
    t.index ["background_id"], name: "index_characters_on_background_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["sense_id"], name: "index_characters_on_sense_id"
  end

  create_table "characters_languages", id: false, force: :cascade do |t|
    t.integer "language_id"
    t.integer "character_id"
    t.index ["character_id"], name: "index_characters_languages_on_character_id"
    t.index ["language_id"], name: "index_characters_languages_on_language_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string  "name"
    t.integer "character_id"
    t.index ["character_id"], name: "index_environments_on_character_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string  "klass_type"
    t.string  "specialization"
    t.integer "hit_die"
    t.string  "saving_throw_proficiency_1"
    t.string  "saving_throw_proficiency_2"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "languages_races", id: false, force: :cascade do |t|
    t.integer "race_id"
    t.integer "language_id"
    t.index ["language_id"], name: "index_languages_races_on_language_id"
    t.index ["race_id"], name: "index_languages_races_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string  "name"
    t.string  "size"
    t.string  "race_type"
    t.string  "subtype"
    t.integer "sense_id"
    t.index ["sense_id"], name: "index_races_on_sense_id"
  end

  create_table "senses", force: :cascade do |t|
    t.string "name"
  end

end
