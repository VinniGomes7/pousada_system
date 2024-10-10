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

ActiveRecord::Schema[7.0].define(version: 2024_10_09_155403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "example_tables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "documento"
    t.string "email"
    t.string "cargo"
    t.string "telefone"
    t.decimal "salario", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospedes", force: :cascade do |t|
    t.string "nome"
    t.string "documento"
    t.string "email"
    t.string "telefone"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quartos", force: :cascade do |t|
    t.integer "numero", null: false
    t.text "descricao"
    t.string "tipo"
    t.decimal "preco_diaria", default: "0.0", null: false
    t.integer "capacidade_maxima", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["numero"], name: "index_quartos_on_numero", unique: true
  end

  create_table "reservas", force: :cascade do |t|
    t.date "data_entrada", null: false
    t.date "data_saida", null: false
    t.bigint "hospede_id", null: false
    t.bigint "quarto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospede_id"], name: "index_reservas_on_hospede_id"
    t.index ["quarto_id"], name: "index_reservas_on_quarto_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservas", "hospedes"
  add_foreign_key "reservas", "quartos"
end
