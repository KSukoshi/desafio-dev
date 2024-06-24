class AddPaymentTransactionRefToPaymentMethod < ActiveRecord::Migration[7.1]
  def change
    add_reference :payment_methods, :payment_transaction, null: true, foreign_key: true
  end
end
