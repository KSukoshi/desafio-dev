require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do

  describe 'class methods' do
    describe '.total_methods' do
      it 'returns the total count of payment methods' do
        # Create some payment methods for testing
        create_list(:payment_method, 3)

        # Call the class method and expect the count to match
        expect(PaymentMethod.total_methods).to eq(3)
      end
    end
  end
end