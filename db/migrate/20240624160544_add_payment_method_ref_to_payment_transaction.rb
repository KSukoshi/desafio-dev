class AddPaymentMethodRefToPaymentTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :payment_transactions, :payment_method, null: true, foreign_key: true
  end
end
