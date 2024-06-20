class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.float :value, limit: 10
      t.string :cpf, limit: 11
      t.string :payment_card, limit: 12
      t.time :payment_at
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
