class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :author, null: false, foreign_key: {to_table: :user} , on_delete: :cascade
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end