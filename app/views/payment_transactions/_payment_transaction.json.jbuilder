json.extract! payment_transaction, :id, :transaction_date, :value, :cpf, :payment_card, :payed_at, :store_owner, :store_name, :created_at, :updated_at
json.url payment_transaction_url(payment_transaction, format: :json)
