# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091023112713) do

  create_table "addresses", :force => true do |t|
    t.string   "address",          :null => false
    t.string   "type_of_building", :null => false
    t.string   "postcode",         :null => false
    t.string   "city",             :null => false
    t.string   "state",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", :force => true do |t|
    t.datetime "time",           :null => false
    t.integer  "destination_id"
    t.integer  "pick_up_id",     :null => false
    t.integer  "user_id",        :null => false
    t.integer  "taxi_type_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", :force => true do |t|
    t.string   "name"
    t.string   "cardnumber"
    t.string   "expirydatemonth"
    t.string   "expirydateyear"
    t.string   "csc"
    t.string   "cardtype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxi_types", :force => true do |t|
    t.string   "taxitype",            :null => false
    t.integer  "price_per_kilometer", :null => false
    t.integer  "price_per_minute",    :null => false
    t.integer  "flag_fee",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                                          :null => false
    t.string   "email",                                                          :null => false
    t.string   "crypted_password",          :limit => 40,                        :null => false
    t.string   "salt",                      :limit => 40,                        :null => false
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                   :default => "passive", :null => false
    t.integer  "discount",                                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

end
