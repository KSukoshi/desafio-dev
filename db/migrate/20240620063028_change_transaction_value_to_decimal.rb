class ChangeTransactionValueToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :value, :decimal
  end
end
