require 'rails_helper'

RSpec.describe PaymentTransactionsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with a valid .txt file' do
      it 'processes the file successfully and redirects to the index' do
        file = fixture_file_upload('valid_payment_transactions.txt', 'text/plain')

        post :create, params: { file: file }

        expect(response).to redirect_to(payment_transactions_path)
        expect(flash[:notice]).to eq('File processed successfully.')
      end
    end

    context 'with an invalid file type' do
      it 'does not process the file and redirects to the transactions list' do
        file = fixture_file_upload('invalid_file.csv', 'text/csv')

        post :create, params: { file: file }

        expect(response).to redirect_to(payment_transactions_path)
        expect(flash[:alert]).to eq('Only .txt files are allowed.')
      end
    end

    context 'with an invalid .txt file' do
      it 'does not process the file and redirects to the transactions list' do
        file = fixture_file_upload('invalid_length_payment_transactions.txt', 'text/plain')

        post :create, params: { file: file }

        expect(response).to redirect_to(payment_transactions_path)
        expect(flash[:alert]).to include('File contains lines not equal to 80 characters:')
      end
    end

    context 'without a file' do
      it 'creates a new payment transaction from parameters' do
        payment_method = create(:payment_method)
        payment_transaction_params = attributes_for(:payment_transaction, payment_method_id: payment_method.id)

        expect {
          post :create, params: { payment_transaction: payment_transaction_params }
        }.to change(PaymentTransaction, :count).by(1)

        expect(response).to redirect_to(payment_transactions_path)
        expect(flash[:notice]).to eq('Transaction was successfully created.')
      end
    end
  end
end
