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

ActiveRecord::Schema.define(version: 20170512195347) do

  create_table "abilities", force: :cascade do |t|
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "character_id"
    t.index ["character_id"], name: "index_abilities_on_character_id"
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

  create_table "character_classes", force: :cascade do |t|
    t.string  "name"
    t.integer "level"
    t.integer "character_id"
    t.index ["character_id"], name: "index_character_classes_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.string  "alignment"
    t.string  "description"
    t.string  "speed"
    t.integer "armor_class"
    t.integer "hit_points"
  end

  create_table "condition_inmunities", force: :cascade do |t|
    t.string  "type"
    t.integer "character_id"
    t.integer "race_id"
    t.index ["character_id"], name: "index_condition_inmunities_on_character_id"
    t.index ["race_id"], name: "index_condition_inmunities_on_race_id"
  end

  create_table "condition_resistances", force: :cascade do |t|
    t.string  "type"
    t.integer "character_id"
    t.integer "race_id"
    t.index ["character_id"], name: "index_condition_resistances_on_character_id"
    t.index ["race_id"], name: "index_condition_resistances_on_race_id"
  end

  create_table "damage_inmunities", force: :cascade do |t|
    t.string  "type"
    t.integer "character_id"
    t.index ["character_id"], name: "index_damage_inmunities_on_character_id"
  end

  create_table "damage_resistances", force: :cascade do |t|
    t.string  "type"
    t.integer "character_id"
    t.integer "race_id"
    t.index ["character_id"], name: "index_damage_resistances_on_character_id"
    t.index ["race_id"], name: "index_damage_resistances_on_race_id"
  end

  create_table "damage_vulnerabilities", force: :cascade do |t|
    t.string  "type"
    t.integer "character_id"
    t.index ["character_id"], name: "index_damage_vulnerabilities_on_character_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string  "name"
    t.integer "character_id"
    t.index ["character_id"], name: "index_environments_on_character_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string  "name"
    t.integer "character_id"
    t.integer "race_id"
    t.index ["character_id"], name: "index_languages_on_character_id"
    t.index ["race_id"], name: "index_languages_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string  "name"
    t.string  "size"
    t.string  "type"
    t.string  "subtype"
    t.integer "character_id"
    t.index ["character_id"], name: "index_races_on_character_id"
  end

  create_table "saving_throws", force: :cascade do |t|
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "character_id"
    t.index ["character_id"], name: "index_saving_throws_on_character_id"
  end

  create_table "senses", force: :cascade do |t|
    t.string  "type"
    t.integer "race_id"
    t.index ["race_id"], name: "index_senses_on_race_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "acrobatics"
    t.integer "arcana"
    t.integer "animal_handling"
    t.integer "athletics"
    t.integer "deception"
    t.integer "history"
    t.integer "insight"
    t.integer "intimidation"
    t.integer "investigation"
    t.integer "medicine"
    t.integer "nature"
    t.integer "perception"
    t.integer "performance"
    t.integer "persuasion"
    t.integer "religion"
    t.integer "stealth"
    t.integer "slight_of_hand"
    t.integer "survival"
    t.integer "character_id"
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

end
