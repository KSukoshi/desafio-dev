class CreatePaymentTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_transactions do |t|
      t.date :transaction_date
      t.decimal :value
      t.string :cpf
      t.string :payment_card
      t.time :payed_at
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
