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

ActiveRecord::Schema[8.0].define(version: 2025_08_21_034928) do
# Could not dump table "active_storage_attachments" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Statement not allowed if access_mode is 'auto'


# Could not dump table "active_storage_blobs" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Statement not allowed if access_mode is 'auto'


# Could not dump table "active_storage_variant_records" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Statement not allowed if access_mode is 'auto'


# Could not dump table "monitor_targets" because of following ActiveRecord::StatementInvalid
#   Mysql2::Error: Statement not allowed if access_mode is 'auto'


  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
