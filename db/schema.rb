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

ActiveRecord::Schema.define(version: 20170515161111) do

  create_table "abilities", force: :cascade do |t|
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
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

  create_table "characters", force: :cascade do |t|
    t.string  "type"
    t.string  "name"
    t.string  "alignment"
    t.string  "description"
    t.string  "speed"
    t.integer "armor_class"
    t.integer "hit_points"
    t.integer "race_id"
    t.integer "sense_id"
    t.integer "background_id"
    t.integer "skill_id"
    t.integer "saving_throw_id"
    t.integer "ability_id"
    t.index ["ability_id"], name: "index_characters_on_ability_id"
    t.index ["background_id"], name: "index_characters_on_background_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["saving_throw_id"], name: "index_characters_on_saving_throw_id"
    t.index ["sense_id"], name: "index_characters_on_sense_id"
    t.index ["skill_id"], name: "index_characters_on_skill_id"
  end

  create_table "characters_features", id: false, force: :cascade do |t|
    t.integer "character_id"
    t.integer "feature_id"
    t.index ["character_id"], name: "index_characters_features_on_character_id"
    t.index ["feature_id"], name: "index_characters_features_on_feature_id"
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

  create_table "features", force: :cascade do |t|
    t.string "type"
    t.string "name"
  end

  create_table "features_races", id: false, force: :cascade do |t|
    t.integer "race_id"
    t.integer "feature_id"
    t.index ["feature_id"], name: "index_features_races_on_feature_id"
    t.index ["race_id"], name: "index_features_races_on_race_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.string  "type"
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

  create_table "saving_throws", force: :cascade do |t|
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
  end

  create_table "senses", force: :cascade do |t|
    t.string "name"
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
    t.integer "initiative"
  end

end
