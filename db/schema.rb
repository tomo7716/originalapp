# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_09_10_100407) do
  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.string "classroom_name"
    t.date "date"
    t.string "course"
    t.string "lesson_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_count"
    t.integer "points"
    t.index ["student_id"], name: "index_lessons_on_student_id"
  end

  create_table "point_exchanges", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.integer "points"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending", null: false
    t.index ["student_id"], name: "index_point_exchanges_on_student_id"
  end

  create_table "students", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lessons", "students"
  add_foreign_key "point_exchanges", "students"
  add_foreign_key "students", "users"
end
