require 'rails_helper'

RSpec.describe "payment_transactions/show", type: :view do
  before(:each) do
    assign(:payment_transaction, PaymentTransaction.create!(
      value: "9.99",
      cpf: "Cpf",
      payment_card: "Payment Card",
      store_owner: "Store Owner",
      store_name: "Store Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Payment Card/)
    expect(rendered).to match(/Store Owner/)
    expect(rendered).to match(/Store Name/)
  end
end
