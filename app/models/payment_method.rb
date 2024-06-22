class PaymentMethod < ApplicationRecord
    has_many :payment_transaction

    def self.total_methods
        count
    end
end
