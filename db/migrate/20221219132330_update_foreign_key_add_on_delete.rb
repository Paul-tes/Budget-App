class UpdateForeignKeyAddOnDelete < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "categories", "purchases"
    remove_foreign_key "categories", "users"
    remove_foreign_key "purchases", "categories"
    remove_foreign_key "purchases", "users"

    add_foreign_key "categories", "purchases", on_delete: :cascade
    add_foreign_key "categories", "users", on_delete: :cascade
    add_foreign_key "purchases", "categories", on_delete: :cascade
    add_foreign_key "purchases", "users", on_delete: :cascade
  end
end
