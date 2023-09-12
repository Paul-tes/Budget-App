class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
