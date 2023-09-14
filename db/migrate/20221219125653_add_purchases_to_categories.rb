class AddPurchasesToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :purchase, null: false, foreign_key: true, index: true
  end
end
