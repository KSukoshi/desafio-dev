json.extract! transaction, :id, :transaction_date, :value, :cpf, :payment_card, :payment_at, :store_owner, :store_name, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
