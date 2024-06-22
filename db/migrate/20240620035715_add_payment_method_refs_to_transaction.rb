class AddPaymentMethodRefsToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :payment_method, null: true, foreign_key: true
  end
end
