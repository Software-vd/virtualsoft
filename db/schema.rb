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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130723151619) do

  create_table "clientes", :force => true do |t|
    t.integer  "tipodoc_id"
    t.string   "numero_documento"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "celular"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "cotizaciondetalles", :force => true do |t|
    t.string   "producto_id"
    t.float    "cantidad"
    t.float    "subtotal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cotizaciones", :force => true do |t|
    t.string   "ciudad"
    t.string   "fecha"
    t.string   "numero_cotizacion"
    t.integer  "tipodoc_id"
    t.string   "numero_documento"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "direccion"
    t.string   "telefono"
    t.integer  "cliente_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "despachos", :force => true do |t|
    t.string   "fecha"
    t.string   "encargado"
    t.integer  "pagos_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estadoentregas", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "facturas", :force => true do |t|
    t.string   "fecha"
    t.string   "tipodoc_id"
    t.string   "numero_documento"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cantidad"
    t.string   "producto_id"
    t.float    "valor"
    t.integer  "cotizacion_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pagos", :force => true do |t|
    t.string   "fecha"
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "estado_entrega_id"
    t.string   "valor"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "productos", :force => true do |t|
    t.integer  "tipo_id"
    t.integer  "tamano_id"
    t.string   "descripcion"
    t.string   "valor"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tamanos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipodocs", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "Descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                     :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
