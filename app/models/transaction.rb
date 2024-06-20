class Transaction < ApplicationRecord
    has_one :payment_method
end
