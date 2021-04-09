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

ActiveRecord::Schema.define(version: 2021_04_09_024501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "erp_articles_articles", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "meta_keywords"
    t.string "meta_description"
    t.boolean "archived"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_erp_articles_articles_on_category_id"
    t.index ["creator_id"], name: "index_erp_articles_articles_on_creator_id"
  end

  create_table "erp_articles_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "alias"
    t.boolean "archived"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_erp_articles_categories_on_parent_id"
  end

  create_table "erp_carts_cart_items", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_id"
    t.bigint "product_id"
    t.index ["cart_id"], name: "index_erp_carts_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_erp_carts_cart_items_on_product_id"
  end

  create_table "erp_carts_carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_contacts_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "date_open"
    t.datetime "date_close"
    t.decimal "current_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_erp_contacts_accounts_on_contact_id"
  end

  create_table "erp_contacts_contact_types", force: :cascade do |t|
    t.string "type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_contacts_contacts", force: :cascade do |t|
    t.string "image_url"
    t.string "code"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "tax_code"
    t.datetime "birthday"
    t.string "email"
    t.string "gender"
    t.text "note"
    t.string "fax"
    t.string "website"
    t.boolean "archived"
    t.string "hotline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.bigint "user_id"
    t.bigint "contact_type_id"
    t.index ["contact_type_id"], name: "index_erp_contacts_contacts_on_contact_type_id"
    t.index ["creator_id"], name: "index_erp_contacts_contacts_on_creator_id"
    t.index ["user_id"], name: "index_erp_contacts_contacts_on_user_id"
  end

  create_table "erp_locations_cities", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "province_id"
    t.index ["province_id"], name: "index_erp_locations_cities_on_province_id"
  end

  create_table "erp_locations_countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_locations_provinces", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_erp_locations_provinces_on_country_id"
  end

  create_table "erp_orders_order_details", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_erp_orders_order_details_on_order_id"
    t.index ["product_id"], name: "index_erp_orders_order_details_on_product_id"
  end

  create_table "erp_orders_orders", force: :cascade do |t|
    t.string "code"
    t.string "customer_name"
    t.string "phone"
    t.string "email"
    t.text "note"
    t.decimal "cache_total"
    t.string "status"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_products_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "archived", default: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_id"
    t.bigint "creator_id"
    t.index ["creator_id"], name: "index_erp_products_categories_on_creator_id"
    t.index ["parent_id"], name: "index_erp_products_categories_on_parent_id"
  end

  create_table "erp_products_products", force: :cascade do |t|
    t.boolean "archived", default: false
    t.string "code"
    t.string "sku"
    t.string "barcode"
    t.string "name"
    t.string "short_description"
    t.text "long_description"
    t.text "meta_keywords"
    t.text "meta_description"
    t.string "color"
    t.string "size"
    t.decimal "weight", default: "0.0"
    t.decimal "volume", default: "0.0"
    t.decimal "cost", default: "0.0"
    t.decimal "price", default: "1.0"
    t.decimal "deal_price"
    t.integer "deal_percent"
    t.boolean "is_new", default: false
    t.boolean "is_deal", default: false
    t.boolean "is_bestseller", default: false
    t.boolean "is_business_choices", default: false
    t.boolean "is_top_business_choices", default: false
    t.boolean "is_sold_out", default: false
    t.boolean "is_stock_inventory", default: false
    t.datetime "deal_from_date"
    t.datetime "deal_to_date"
    t.boolean "can_be_sold", default: true
    t.boolean "can_be_purchased", default: true
    t.decimal "stock_min"
    t.decimal "stock_max"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.bigint "creator_id"
    t.index ["category_id"], name: "index_erp_products_products_on_category_id"
    t.index ["creator_id"], name: "index_erp_products_products_on_creator_id"
  end

  create_table "erp_user_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.date "birthday"
    t.text "description"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_erp_user_profiles_on_user_id", unique: true
  end

  create_table "erp_user_roles", force: :cascade do |t|
    t.string "name", default: "DEFAULT"
    t.integer "level", default: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_user_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_erp_user_rooms_on_group_id"
    t.index ["user_id"], name: "index_erp_user_rooms_on_user_id"
  end

  create_table "erp_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "status", default: "ACTIVE"
    t.bigint "creator_id"
    t.bigint "role_id"
    t.index ["creator_id"], name: "index_erp_users_on_creator_id"
    t.index ["email"], name: "index_erp_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_erp_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_erp_users_on_role_id"
  end

  create_table "erp_warehouses_fluctuation_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "weight"
    t.decimal "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.bigint "fluctuation_id"
    t.index ["fluctuation_id"], name: "index_erp_warehouses_fluctuation_items_on_fluctuation_id"
    t.index ["product_id"], name: "index_erp_warehouses_fluctuation_items_on_product_id"
  end

  create_table "erp_warehouses_fluctuations", force: :cascade do |t|
    t.string "fluctuation_type"
    t.string "description"
    t.datetime "schedule_date"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "erp_warehouses_inventories", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "weight"
    t.decimal "volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id"
    t.bigint "warehouse_id"
    t.index ["product_id"], name: "index_erp_warehouses_inventories_on_product_id"
    t.index ["warehouse_id"], name: "index_erp_warehouses_inventories_on_warehouse_id"
  end

  create_table "erp_warehouses_warehouses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
