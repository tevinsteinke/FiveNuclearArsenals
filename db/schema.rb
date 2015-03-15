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

ActiveRecord::Schema.define(version: 20150315120413) do

  create_table "follow_up_surveys", force: true do |t|
    t.string   "weaponsBenefit"
    t.string   "superiorRussia"
    t.string   "equalRussia"
    t.string   "adversaryRelevancy"
    t.string   "ssbnSurvivability"
    t.string   "survivabilityImportance"
    t.string   "ssbnValue"
    t.string   "icbmValue"
    t.string   "groupOneSuggestions"
    t.string   "groupTwoSuggestions"
    t.string   "groupThreeSuggestions"
    t.string   "groupFourSuggestions"
    t.string   "groupFiveSuggestions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user"
    t.text     "comments"
  end

  create_table "initial_surveys", force: true do |t|
    t.string   "timeSpent"
    t.string   "currentPosition"
    t.string   "positionAffiliation"
    t.string   "weaponsBenefit"
    t.string   "superiorToRussia"
    t.string   "equalToRussia"
    t.string   "numberOfWeapons"
    t.string   "ssbnSurvivability"
    t.string   "survivabilityImportance"
    t.string   "ssbnValuable"
    t.string   "icbmValuable"
    t.string   "groupOneSuggestions"
    t.string   "groupTwoSuggestions"
    t.string   "groupThreeSuggestions"
    t.string   "groupFourSuggestions"
    t.string   "groupFiveSuggestions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user"
    t.string   "age"
  end

  create_table "simulations", force: true do |t|
    t.integer  "blueInventory"
    t.integer  "redInventory"
    t.integer  "icbmMax"
    t.float    "icbmMirv"
    t.decimal  "icbmProb"
    t.integer  "icbmAvail"
    t.boolean  "icbmBlueLaunch"
    t.decimal  "icbmBluePk"
    t.integer  "subsOperational"
    t.decimal  "subsAtSea"
    t.boolean  "subsRoundUp"
    t.integer  "subsWeaps"
    t.integer  "subsPlusIcbms"
    t.integer  "subsPlusBombs"
    t.integer  "subsTubes"
    t.decimal  "subsMirv",                       precision: 10, scale: 2
    t.integer  "subsNavy"
    t.integer  "bombsNumber"
    t.boolean  "bombsSurvive"
    t.integer  "bombsPostStrike"
    t.integer  "redRatio"
    t.boolean  "redTarget"
    t.decimal  "redPk"
    t.integer  "redBases"
    t.integer  "redBlueIcbms"
    t.integer  "redFirstStrike"
    t.integer  "redSurviving"
    t.integer  "blueSurviving"
    t.integer  "deltaSurviving"
    t.float    "ratioSurviving"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "subsSeaRate"
    t.text     "comments",           limit: 255
    t.string   "user"
    t.text     "recommendComments"
    t.text     "unexpectedComments"
    t.text     "vulnerableComments"
    t.float    "bombsPercentage"
  end

end
