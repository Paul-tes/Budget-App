class ChangePurchaseColumnNotNullToNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:categories, :purchase_id, true, 0 )
  end
end
