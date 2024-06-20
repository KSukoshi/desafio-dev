require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/payment_transactions", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # PaymentTransaction. As you add validations to PaymentTransaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PaymentTransaction.create! valid_attributes
      get payment_transactions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      payment_transaction = PaymentTransaction.create! valid_attributes
      get payment_transaction_url(payment_transaction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_payment_transaction_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      payment_transaction = PaymentTransaction.create! valid_attributes
      get edit_payment_transaction_url(payment_transaction)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PaymentTransaction" do
        expect {
          post payment_transactions_url, params: { payment_transaction: valid_attributes }
        }.to change(PaymentTransaction, :count).by(1)
      end

      it "redirects to the created payment_transaction" do
        post payment_transactions_url, params: { payment_transaction: valid_attributes }
        expect(response).to redirect_to(payment_transaction_url(PaymentTransaction.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PaymentTransaction" do
        expect {
          post payment_transactions_url, params: { payment_transaction: invalid_attributes }
        }.to change(PaymentTransaction, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post payment_transactions_url, params: { payment_transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested payment_transaction" do
        payment_transaction = PaymentTransaction.create! valid_attributes
        patch payment_transaction_url(payment_transaction), params: { payment_transaction: new_attributes }
        payment_transaction.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the payment_transaction" do
        payment_transaction = PaymentTransaction.create! valid_attributes
        patch payment_transaction_url(payment_transaction), params: { payment_transaction: new_attributes }
        payment_transaction.reload
        expect(response).to redirect_to(payment_transaction_url(payment_transaction))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        payment_transaction = PaymentTransaction.create! valid_attributes
        patch payment_transaction_url(payment_transaction), params: { payment_transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested payment_transaction" do
      payment_transaction = PaymentTransaction.create! valid_attributes
      expect {
        delete payment_transaction_url(payment_transaction)
      }.to change(PaymentTransaction, :count).by(-1)
    end

    it "redirects to the payment_transactions list" do
      payment_transaction = PaymentTransaction.create! valid_attributes
      delete payment_transaction_url(payment_transaction)
      expect(response).to redirect_to(payment_transactions_url)
    end
  end
end
