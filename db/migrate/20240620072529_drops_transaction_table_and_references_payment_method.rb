class DropsTransactionTableAndReferencesPaymentMethod < ActiveRecord::Migration[7.1]
  def change
    drop_table :transactions

    add_reference :payment_transactions, :payment_method, null: true, foreign_key: true
    add_reference :payment_methods, :payment_transaction, null: true, foreign_key: false
  end
end
