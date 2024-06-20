class PaymentMethod < ApplicationRecord
    has_many :payment_transaction
end
