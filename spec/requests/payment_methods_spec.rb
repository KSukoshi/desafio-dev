require 'rails_helper'

RSpec.describe "/payment_methods", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # PaymentMethod. As you add validations to PaymentMethod, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PaymentMethod.create! valid_attributes
      get payment_methods_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      payment_method = PaymentMethod.create! valid_attributes
      get payment_method_url(payment_method)
      expect(response).to be_successful
    end
  end


  describe "GET /edit" do
    it "renders a successful response" do
      payment_method = PaymentMethod.create! valid_attributes
      get edit_payment_method_url(payment_method)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PaymentMethod" do
        expect {
          post payment_methods_url, params: { payment_method: valid_attributes }
        }.to change(PaymentMethod, :count).by(1)
      end

      it "redirects to the created payment_method" do
        post payment_methods_url, params: { payment_method: valid_attributes }
        expect(response).to redirect_to(payment_method_url(PaymentMethod.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PaymentMethod" do
        expect {
          post payment_methods_url, params: { payment_method: invalid_attributes }
        }.to change(PaymentMethod, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post payment_methods_url, params: { payment_method: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested payment_method" do
        payment_method = PaymentMethod.create! valid_attributes
        patch payment_method_url(payment_method), params: { payment_method: new_attributes }
        payment_method.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the payment_method" do
        payment_method = PaymentMethod.create! valid_attributes
        patch payment_method_url(payment_method), params: { payment_method: new_attributes }
        payment_method.reload
        expect(response).to redirect_to(payment_method_url(payment_method))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        payment_method = PaymentMethod.create! valid_attributes
        patch payment_method_url(payment_method), params: { payment_method: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested payment_method" do
      payment_method = PaymentMethod.create! valid_attributes
      expect {
        delete payment_method_url(payment_method)
      }.to change(PaymentMethod, :count).by(-1)
    end

    it "redirects to the payment_methods list" do
      payment_method = PaymentMethod.create! valid_attributes
      delete payment_method_url(payment_method)
      expect(response).to redirect_to(payment_methods_url)
    end
  end
end
