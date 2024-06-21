require 'rails_helper'

RSpec.describe PaymentTransaction, type: :model do
  describe 'class methods' do
    describe '.positive_values' do
      it 'calculates the sum of positive values for payment type "Entrada"' do
        # Create payment transactions with positive values
        create(:payment_transaction, value: 100, payment_method: create(:payment_method, payment_type: 'Entrada'))
        create(:payment_transaction, value: 200, payment_method: create(:payment_method, payment_type: 'Entrada'))
        
        # Create a payment transaction with negative value to ensure it's not counted
        create(:payment_transaction, value: -50, payment_method: create(:payment_method, payment_type: 'Saída'))
        
        expect(PaymentTransaction.positive_values).to eq(300)
      end
    end

    describe '.negative_values' do
      it 'calculates the sum of negative values for payment type "Saída"' do
        # Create payment transactions with negative values
        create(:payment_transaction, value: -50, payment_method: create(:payment_method, payment_type: 'Saída'))
        create(:payment_transaction, value: -75, payment_method: create(:payment_method, payment_type: 'Saída'))
        
        # Create a payment transaction with positive value to ensure it's not counted
        create(:payment_transaction, value: 100, payment_method: create(:payment_method, payment_type: 'Entrada'))
        
        expect(PaymentTransaction.negative_values).to eq(-125)
      end
    end

    describe '.total_value.to_f' do
      it 'calculates the total value (positive - negative) of transactions' do
        # Create payment transactions with values
        create(:payment_transaction, value: 200, payment_method: create(:payment_method, payment_type: 'Entrada'))
        create(:payment_transaction, value: 50, payment_method: create(:payment_method, payment_type: 'Saída'))
        create(:payment_transaction, value: 100, payment_method: create(:payment_method, payment_type: 'Entrada'))
        
        expect(PaymentTransaction.total_value.to_f).to eq(250)
      end
    end

    describe '.total_transactions' do
      it 'returns the total count of payment transactions' do
        # Create some payment transactions for testing
        create_list(:payment_transaction, 3)

        expect(PaymentTransaction.total_transactions).to eq(3)
      end
    end
  end
end