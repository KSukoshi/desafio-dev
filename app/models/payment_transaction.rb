class PaymentTransaction < ApplicationRecord
    belongs_to :payment_method

    def self.positive_values
        joins(:payment_method)
          .where(payment_methods: { payment_type: 'Entrada' })
          .sum(:value)
    end

    def self.negative_values
        joins(:payment_method)
          .where(payment_methods: { payment_type: 'Saída' })
          .sum(:value)
    end

    def self.total_value
        positive_values - negative_values
    end

    def self.total_transactions
        count
    end
end
