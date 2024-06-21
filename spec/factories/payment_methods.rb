require 'faker'

FactoryBot.define do
    factory :payment_method do
      payment_description { Faker::Lorem.sentence }
      payment_type { ['Entrada', 'Saída'].sample }
    end
  end