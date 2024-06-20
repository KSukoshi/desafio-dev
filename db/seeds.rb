# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PaymentMethod.create([
  { payment_description: 'Débito', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Boleto', payment_type: 'Saída', payment_transaction_id: nil },
  { payment_description: 'Financiamento', payment_type: 'Saída', payment_transaction_id: nil },
  { payment_description: 'Crédito', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Recebimento Empréstimo', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Vendas', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Recebimento TED', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Recebimento DOC', payment_type: 'Entrada', payment_transaction_id: nil },
  { payment_description: 'Aluguel', payment_type: 'Saída', payment_transaction_id: nil }
])