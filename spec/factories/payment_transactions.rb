require 'faker'

FactoryBot.define do
    factory :payment_transaction do
      transaction_date { Faker::Date.backward(days: 14) }
      value { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
      cpf { Faker::Number.number(digits: 11) }
      payment_card { Faker::Number.number(digits: 16) }
      payed_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
      store_owner { Faker::Name.name }
      store_name { Faker::Company.name }
  
      association :payment_method
    end
  end