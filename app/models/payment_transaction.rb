class PaymentTransaction < ApplicationRecord
    belongs_to :payment_method
end
