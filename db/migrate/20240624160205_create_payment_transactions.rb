class CreatePaymentTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_transactions do |t|
      t.date :transaction_date
      t.decimal :value
      t.string :cpf, limit: 11
      t.string :payment_card, limit: 12
      t.time :paid_at
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
