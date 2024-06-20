class DeleteOldTransactionId < ActiveRecord::Migration[7.1]
  def change
    remove_column :payment_methods, :transaction_id
  end
end
