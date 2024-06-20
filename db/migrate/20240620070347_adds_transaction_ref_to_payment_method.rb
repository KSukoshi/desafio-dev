class AddsTransactionRefToPaymentMethod < ActiveRecord::Migration[7.1]
  def change
    add_reference :payment_methods, :transaction, null: true, foreign_key: false
  end
end
