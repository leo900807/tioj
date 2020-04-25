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

ActiveRecord::Schema.define(version: 20200118041340) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["username"], name: "index_admin_users_on_username", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "era",        limit: 4
    t.boolean  "pinned"
    t.integer  "category",   limit: 4
    t.boolean  "public"
  end

  add_index "articles", ["category", "pinned", "era"], name: "index_articles_on_category_and_pinned_and_era", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.string   "path",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["article_id"], name: "index_attachments_on_article_id", using: :btree

  create_table "ban_compilers", force: :cascade do |t|
    t.integer  "contest_id",  limit: 4
    t.integer  "compiler_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "ban_compilers", ["compiler_id"], name: "fk_rails_6b2cbab705", using: :btree
  add_index "ban_compilers", ["contest_id", "compiler_id"], name: "index_ban_compilers_on_contest_id_and_compiler_id", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "compilers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "format_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "contest_problem_joints", force: :cascade do |t|
    t.integer  "contest_id", limit: 4
    t.integer  "problem_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contest_problem_joints", ["contest_id", "problem_id"], name: "contest_task_ix", unique: true, using: :btree

  create_table "contests", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "contest_type",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cd_time",            limit: 4,     default: 15,   null: false
    t.boolean  "disable_discussion",               default: true, null: false
    t.integer  "freeze_time",        limit: 4,                    null: false
    t.boolean  "show_detail_result",               default: true, null: false
    t.integer  "visible_state",      limit: 4,     default: 0
  end

  add_index "contests", ["start_time", "end_time"], name: "index_contests_on_start_time_and_end_time", using: :btree

  create_table "judge_servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "ip",         limit: 255
    t.string   "key",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "limits", force: :cascade do |t|
    t.integer  "time",         limit: 4, default: 1000
    t.integer  "memory",       limit: 4, default: 65536
    t.integer  "output",       limit: 4, default: 65536
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "testdatum_id", limit: 4
  end

  add_index "limits", ["testdatum_id"], name: "index_limits_on_testdatum_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "content",        limit: 65535
    t.integer  "user_id",        limit: 4
    t.integer  "problem_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contest_id",     limit: 4
    t.boolean  "global_visible",               default: true, null: false
  end

  add_index "posts", ["contest_id"], name: "index_posts_on_contest_id", using: :btree
  add_index "posts", ["updated_at"], name: "index_posts_on_updated_at", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "problems", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.text     "source",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "input",          limit: 65535
    t.text     "output",         limit: 65535
    t.text     "example_input",  limit: 65535
    t.text     "example_output", limit: 65535
    t.text     "hint",           limit: 65535
    t.integer  "visible_state",  limit: 4,        default: 0
    t.integer  "problem_type",   limit: 4
    t.text     "sjcode",         limit: 16777215
    t.text     "interlib",       limit: 16777215
    t.integer  "old_pid",        limit: 4
  end

  add_index "problems", ["name"], name: "index_problems_on_name", using: :btree
  add_index "problems", ["visible_state"], name: "index_problems_on_visible_state", using: :btree

  create_table "submission_tasks", force: :cascade do |t|
    t.integer  "submission_id", limit: 4
    t.integer  "position",      limit: 4
    t.string   "result",        limit: 255
    t.integer  "time",          limit: 4
    t.integer  "memory",        limit: 4
    t.decimal  "score",                     precision: 18, scale: 6
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "submission_tasks", ["submission_id", "position"], name: "index_submission_tasks_on_submission_id_and_position", unique: true, using: :btree
  add_index "submission_tasks", ["submission_id"], name: "index_submission_tasks_on_submission_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.text     "code",         limit: 16777215
    t.string   "result",       limit: 255,                               default: "queued"
    t.decimal  "score",                         precision: 18, scale: 6, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id",   limit: 4,                                 default: 0
    t.integer  "user_id",      limit: 4,                                 default: 0
    t.integer  "contest_id",   limit: 4
    t.integer  "total_time",   limit: 4
    t.integer  "total_memory", limit: 4
    t.text     "message",      limit: 65535
    t.integer  "compiler_id",  limit: 4,                                 default: 1,        null: false
  end

  add_index "submissions", ["compiler_id"], name: "fk_rails_55e5b9f361", using: :btree
  add_index "submissions", ["contest_id"], name: "index_submissions_on_contest_id", using: :btree
  add_index "submissions", ["problem_id"], name: "index_submissions_on_problem_id", using: :btree
  add_index "submissions", ["result"], name: "index_submissions_on_result", using: :btree
  add_index "submissions", ["total_time", "total_memory"], name: "submissions_sort_ix", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "testdata", force: :cascade do |t|
    t.integer  "problem_id",  limit: 4
    t.string   "test_input",  limit: 255
    t.string   "test_output", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    limit: 4
  end

  create_table "testdata_sets", force: :cascade do |t|
    t.integer  "problem_id",  limit: 4
    t.decimal  "score",                     precision: 18, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "td_list",     limit: 255,                            null: false
    t.text     "constraints", limit: 65535
  end

  add_index "testdata_sets", ["problem_id"], name: "index_testdata_sets_on_problem_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",               limit: 255
    t.string   "avatar",                 limit: 255
    t.boolean  "admin",                              default: false
    t.string   "username",               limit: 255
    t.string   "motto",                  limit: 255
    t.string   "school",                 limit: 255
    t.integer  "gradyear",               limit: 4
    t.string   "name",                   limit: 255
    t.datetime "last_submit_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "ban_compilers", "compilers"
  add_foreign_key "ban_compilers", "contests"
  add_foreign_key "posts", "contests"
  add_foreign_key "submissions", "compilers"
end
